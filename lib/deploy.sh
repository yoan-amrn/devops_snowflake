#! /bin/bash

#/ Prepare and execute scripts for Snowflake.
#/
#/ Syntax: deploy.sh action [-e env] [-v version] [-d root_dir] [-y] [-h]
#/
#/ Parameters:
#/   action  Action to perform. Possible values:
#/             init: Setup the deployment structures in Snowflake
#/             prep[are]: Prepare the scripts files based on last saved state
#/             exec[ute]: Run the prepared scripts
#/             clean: Remove deploy folder and logs
#/
#/ Options:
#/   e  Target deployment env (dev/uat/prod). Defaults to current git branch.
#/   v  Version to be deployed. Can be selected at runtime.
#/   d  Root directory containing SQL scripts. Defaults to "scripts".
#/   y  Do not ask for confirmation before deploying.
#/   h  Display this help.
#/
#/ External dependencies:
#/   SnowSQL
#/   JQ

set -o errexit  # abort on nonzero exitstatus
set -o nounset  # abort on unbound variable
set -o pipefail # don't hide errors within pipes
# set -x

PROG_NAME=$(basename "$0")
PROG_DIR=$(readlink -m "$(dirname "$0")")
readonly PROG_NAME PROG_DIR

# shellcheck source=lib/helpers.sh
source "${PROG_DIR}/helpers.sh"

STATUS_SUCCESS="success"
STATUS_FAIL="fail"
readonly STATUS_SUCCESS STATUS_FAIL

DEPENDENCIES=("snowsql" "jq")
readonly DEPENDENCIES

REQUIRED_ENV=("SNOWSQL_ACCOUNT" "SNOWSQL_USER" "SNOWSQL_ROLE" "SNOWSQL_WAREHOUSE")
readonly REQUIRED_ENV

export PATH="$PATH:/home/runner/.local/bin"

# Print on STDOUT the usage message based on the header comment in the script
# The comment should start with #/ followed by either a newline or a space
deploy::usage() {
    grep '^#/' "${PROG_DIR}/${PROG_NAME}" | sed 's/^#\/\($\| \)//'
    exit
}

__cleanup() {
    rm -rf "${tmp_dir}"
}

# Execute the SQL file passed with snowsql
__execute_file() {
    local file tmp_result
    file="${1}"

    logging::info "Executing file ${file#*TO_DEPLOY}"
    tmp_result="${tmp_dir}/$(basename "${file}").result"

    # shellcheck disable=SC2046
    if ! snowsql -o friendly=false -o exit_on_error=true -f "${file}" $(helpers::get_snowsql_auth_params) | tee "${tmp_result}"; then
        return 1
    fi

    # Check if there are errors in SQL result
    if grep -q "SQLERRM" "$tmp_result"; then
        return 2
    fi

    return 0
}

__retrieve_stored_state() {
    logging::info "Retrieving current state"

    query="select
            array_agg(object_construct(*))
            from
            (
                select *
                from tech.deploy_state
                qualify rank() over (partition by filekey order by run_time desc) = 1
            );
    "

    # shellcheck disable=SC2046
    snowsql \
        -o exit_on_error=true \
        -o friendly=false \
        -o quiet=true \
        -q "${query}" \
        -o header=false \
        -o output_format=plain \
        -o output_file="${state_file}" \
        $(helpers::get_snowsql_auth_params)
}

# Get stored info for a file
# Args:
#   - 1: Key of the file
#   - 2: Value to be retrieved (HASH or STATUS)
__get_file_stored_state() {
    local key val
    key="${1}"
    val="${2}"

    jq -r --arg KEY "${key}" --arg VAL "${val}" '.[] | select(.FILEKEY==$KEY) | .[$VAL]' "${state_file}"
}

__get_file_key() {
    local file pattern
    file="${1}"

    if [[ "${file}" == *${prepared_dir}/* ]]; then
        pattern="${prepared_dir}"
    elif [[ "${file}" == *${root_script_dir}/* ]]; then
        pattern="${root_script_dir}"
    else
        logging::error "File ${file} does not match expected pattern."
    fi

    echo "${file#*"$pattern"}"
}

# Maintain the hash of executed file in the state db
__maintain_state() {
    local file query filekey hash status

    file="${1}"
    status="${2:-$STATUS_SUCCESS}"

    filekey=$(__get_file_key "${file}")
    hash=$(<"${file}.md5sum")

    logging::info "Maintaining new state for ${filekey} into database"

    query="insert into tech.deploy_state (filekey, hash, run_time, status)
            values ( '${filekey}', '${hash}', current_timestamp(), '${status}');"

    # shellcheck disable=SC2046
    snowsql \
        -o exit_on_error=true \
        -o friendly=false \
        -o quiet=true \
        -q "${query}" \
        $(helpers::get_snowsql_auth_params)
}

# Checks whether the last execution of a file is successful
# Args:
#   - 1: File to check
__is_file_last_run_failed() {
    local file
    file="${1}"

    filekey=$(__get_file_key "${file}")

    past_state=$(__get_file_stored_state "${filekey}" "STATUS")

    [[ "${past_state}" != "$STATUS_SUCCESS" ]]
}

# Checks  current version of the file with the stored info
# Args:
#   - 1: File to check
__is_file_different() {
    local file
    file="${1}"

    filekey=$(__get_file_key "${file}")

    past_hash=$(__get_file_stored_state "${filekey}" "HASH")
    curr_hash=$(md5sum "${file}" | cut -d " " -f 1)

    [[ "${curr_hash}" != "${past_hash}" ]]
}

# Check whether a script file should be repeated for every run
# Args:
#   - 1: File to check
__is_file_repeatable() {
    local file
    file="${1}"

    [[ $(basename "${file}") =~ ^.*R__.*\.sql ]]
}

__prepare_file() {
    local file target_dir target_file
    file="${1}"

    filekey=$(__get_file_key "${file}")
    curr_hash=$(md5sum "${file}" | cut -d " " -f 1)

    target_dir=$(echo "${prepared_dir}${filekey}" | rev | cut -d "/" -f 2- | rev)
    target_file="${prepared_dir}${filekey}"

    mkdir -p "${target_dir}"
    cp "${file}" "${target_file}"

    helpers::replace_placeholder "${target_file}" "${env}.env"
    echo "${curr_hash}" >"${target_file}.md5sum"
}

# Initialize state database
deploy::init() {
    local query

    mkdir -p "$(dirname "${state_file}")"

    query="create table if not exists tech.deploy_state (
            filekey     varchar(255)
            , hash      varchar(32)
            , run_time  timestamp
            , status    varchar(32)
            , primary key (filekey, run_time)
        );"

    # shellcheck disable=SC2046
    if snowsql -o exit_on_error=true -o friendly=false -o quiet=true -q "${query}" $(helpers::get_snowsql_auth_params); then
        logging::info "Database initialized"
    else
        logging::die "Failed to initialize"
    fi

    logging::info "Save current files state in the database"

    for file in $(find "${root_script_dir}" -name "*.sql" | sort); do
        if [[ -f "${file}" ]]; then
            __prepare_file "${file}"
        fi
    done

    for file in $(find "${prepared_dir}" -name "*.sql" | sort); do
        if [[ -f "${file}" ]]; then
            __maintain_state "${file}" "$STATUS_SUCCESS"
        fi
    done
}

# Select the files to be executed, using the maintained state
deploy::prepare() {
    local file files_changed filekey reason

    files_changed=0

    # remove previous data
    rm -rf "${prepared_dir}"

    __retrieve_stored_state

    logging::info "Checking files in '${root_script_dir}' dir"

    for file in $(find "${root_script_dir}" -name "*.sql" | sort); do
        if [[ ! -f "${file}" ]]; then
            continue
        fi

        filekey=$(__get_file_key "${file}")

        logging::info "[${filekey}] - Checking file ..."

        reason=

        __is_file_repeatable "${file}" && reason="File is repeatable"
        __is_file_different "${file}" && reason="Changes detected"
        __is_file_last_run_failed "${file}" && reason="Last execution failed"

        if [[ -z "${reason}" ]]; then
            logging::info "[${filekey}] - No reason to execute: skipping file."
            continue
        fi

        logging::info "[${filekey}] - Added to execution plan. Reason: ${reason}."

        __prepare_file "${file}"

        files_changed=$((files_changed + 1))
    done

    if [[ "${files_changed}" -eq 0 ]]; then
        logging::success "No file to execute"
    else
        logging::info "Files prepared in ${prepared_dir}"
        logging::success "Preparation completed"
    fi
}

# Run the prepared scripts with snowsql
#   Execute the produced script with snowsql
#   Maintain the associated state into the db
deploy::execute() {
    local choice file

    if [[ "${ask_for_confirmation}" == true ]]; then
        read -p "Prepared scripts will be executed in ${env}. Continue (y/n)? " -n 1 -r choice
        echo

        case "${choice}" in
        y | Y) logging::info "Proceeding" ;;
        n | N)
            logging::info "Stopping execution"
            exit 1
            ;;
        *) logging::die "Invalid choice" ;;
        esac
    fi

    for file in $(find "${prepared_dir}" -name "*.sql" | sort); do
        if [[ ! -f "${file}" ]]; then
            continue
        fi

        if ! __execute_file "${file}"; then
            __maintain_state "${file}" "$STATUS_FAIL"
            logging::die "Execution failed for ${file} - aborting"
        fi

        __maintain_state "${file}" "$STATUS_SUCCESS"
    done

    logging::success "Execution successful"
}

# Clean the artifacts
deploy::clean() {
    rm -rf "${prepared_dir}"
    rm -rf "${tmp_dir}"
}

# Main method of the script
#   Read and check the parameters
#   Perform the passed action
main() {
    local env ask_for_confirmation prepared_dir state_file script_args action root_script_dir

    env=
    root_script_dir=
    ask_for_confirmation=true
    prepared_dir="${ARTIFACT_NAME:-TO_RUN}"
    tmp_dir=$(mktemp -d "${TMPDIR:-/tmp/}$(basename "$0").XXXXXXXXXXXX")
    state_file="${tmp_dir}/state.json"

    # Get the options
    script_args=()
    while [[ "${OPTIND}" -le $# ]]; do
        if getopts e:d:yh option; then
            case "${option}" in
            e) env="${OPTARG}" ;;
            d) root_script_dir="${OPTARG}" ;;
            y) ask_for_confirmation=false ;;
            h) deploy::usage ;;
            \?) exit 1 ;;
            esac
        else
            script_args+=("${!OPTIND}")
            ((OPTIND++))
        fi
    done

    if ! helpers::check_dependencies "${DEPENDENCIES[@]}"; then
        logging::die "Missing required dependency"
    fi

    if ! helpers::check_environment "${REQUIRED_ENV[@]}"; then
        logging::die "Missing required environment variable"
    fi

    if ! helpers::get_snowsql_auth_params; then
        logging::die "Missing required environment variable for SnowSQL auth"
    fi

    # Check that an action has been provided
    if [[ ${#script_args[@]} -ne 1 ]]; then
        logging::die "Missing action to perform. 'deploy.sh -h' for more information"
    fi

    action=${script_args:0}

    # Add default values if needed
    if [[ -z "${env}" ]]; then
        env=$(helpers::get_curr_branch_name)
    fi

    env=$(echo "${env}" | tr '[:upper:]' '[:lower:]')

    if [[ -z "${root_script_dir}" ]]; then
        root_script_dir="scripts"
    fi

    # Run action
    case "${action}" in
    init) deploy::init "${state_file}" ;;
    prep | prepare) deploy::prepare ;;
    exec | execute) deploy::execute ;;
    clean) deploy::clean ;;
    *) logging::die "Invalid action '${action}'. 'deploy.sh -h' for more information" ;;
    esac
}

trap __cleanup EXIT

main "$@"
