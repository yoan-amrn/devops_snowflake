#! /bin/bash

# shellcheck source=lib/logging.sh
source "${BASH_SOURCE%/*}/logging.sh"

# Check that required dependencies are installed
# Args:
#   1: Array of dependencies
# Return codes:
#   0 if all deps are present
#   sum of (2 ^ index) of the dependency in the passed array
helpers::check_dependencies() {
    local dependencies=("$@")
    local result=0

    for i in "${!dependencies[@]}"; do
        if [[ ! "$(command -v "${dependencies[$i]}")" ]]; then
            logging::error "Missing ${dependencies[$i]} dependency"
            result+=$((2 ** i))
        fi
    done

    return "${result}"
}

# Check that required environment variables
# Args:
#   1: Array of variable names
# Return codes:
#   0 if all variables are set
#   sum of (2 ^ index) of the variable in the passed array
helpers::check_environment() {
    local vars=("$@")
    local result=0

    for i in "${!vars[@]}"; do
        if [[ "${!vars[$i]-x}" == x ]]; then
            logging::error "Missing ${vars[$i]} in environment"
            result+=$((2 ** i))
        fi
    done

    return "${result}"
}

# Get db name from git repo name
# Output:
#   Write db name to stdout
helpers::get_repo_name() {
    basename "$(git rev-parse --show-toplevel)"
}

# Get env name from current active git branch
# Output:
#   Write env name to stdout
helpers::get_curr_branch_name() {
    local git_branch

    git_branch="$(git symbolic-ref --short HEAD)"
    echo "${git_branch}" | tr '[:upper:]' '[:lower:]'
}

# Ask the user to select one of the dir in the dir passed as parameter
# Arguments:
#   1   Path of the dir to search
# Output:
#   Write the selected dir to stdout
helpers::select_subdir() {
    local search_dir="${1}"

    select version in $(find "${search_dir}"/* -maxdepth 0 -type d -printf '%f\n'); do
        echo "${version}"
        break
    done
}

# Replace the placeholders (format: ${placeholder}) in a file with a value
# Arguments:
#   1   Path of the file to edit
#   3   Path of the file with the variables definitions
helpers::replace_placeholder() {
    local file="${1}"
    local env_file="${2}"

    if [[ ! -f "${file}" ]]; then
        logging::error "Trying to update non-existing file: ${file}"
    fi

    if [[ ! -f "${env_file}" ]]; then
        logging::error "Missing env configuration file: ${env_file}"
    fi

    # Run substitution in subshell, to isolate export from source
    (
        set -o allexport
        # shellcheck source=/dev/null
        source "${env_file}"
        set +o allexport

        # Can't write in place with envsubst: need to use a temporary file
        tmp_file=$(mktemp)
        cp --attributes-only --preserve "${file}" "${tmp_file}"
        envsubst "$(sed -e 's/=.*//' -e 's/^/\$/g' <"${env_file}")" <"${file}" >"${tmp_file}"
        mv "${tmp_file}" "${file}"
    )
}

helpers::get_snowsql_auth_params() {
    local snowsql_params=""

    if [[ -n "$SNOWSQL_PRIVATE_KEY_PASSPHRASE" && -n "$SNOWSQL_PRIVATE_KEY" ]]; then
        echo "$SNOWSQL_PRIVATE_KEY" > /home/runner/.local/snowsql_key.p8
        chmod 600 /home/runner/.local/snowsql_key.p8
        snowsql_params="--private-key-path /home/runner/.local/snowsql_key.p8"
    elif [[ -n "$SNOWSQL_USER" && -n "$SNOWSQL_PWD" ]]; then
        snowsql_params=""
    else
        logging::error "Missing required SNOWSQL authentication environment variables"
        return 1
    fi

    echo "$snowsql_params"
}
