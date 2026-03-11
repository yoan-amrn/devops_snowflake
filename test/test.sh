#! /bin/bash

set -o errexit  # abort on nonzero exitstatus
set -o nounset  # abort on unbound variable
set -o pipefail # don't hide errors within pipes

PROG_DIR=$(readlink -m "$(dirname "$0")")
readonly PROG_DIR

# shellcheck source=lib/helpers.sh
source "${PROG_DIR}/../lib/helpers.sh"

all_ok=

test::helpers::replace_placeholder() {
    logging::info "Testing [helpers::replace_placeholder]"

    cp ./test_script.sql ./test_script.sql.test

    helpers::replace_placeholder ./test_script.sql.test ./dev.env

    test_hash=$(md5sum test_script.sql.test | cut -d " " -f 1)
    exp_hash=$(md5sum test_script.sql.expected | cut -d " " -f 1)

    [[ "${test_hash}" == "${exp_hash}" ]]
}

if test::helpers::replace_placeholder; then
    logging::ok "OK"
else
    logging::error "Test file does not match expected"
    all_ok='N'
fi

__cleanup() {
    rm ./*.test
}

if [[ -z ${all_ok} ]]; then
    __cleanup
fi

# trap __cleanup EXIT
