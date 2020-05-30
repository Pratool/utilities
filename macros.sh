#!/bin/bash
# Macros and functions

# Quick dir switcher
function workon()
{
    local PREFIX="${HOME}/Documents/projects"
    local WORKSPACE="${1:-}"
    if [[ -z "${WORKSPACE}" ]] || [[ ! -d "${PREFIX}/${WORKSPACE}" ]] ; then
        echo "Invalid workspace: ${WORKSPACE}" >&2
    else
        cd "${PREFIX}/${WORKSPACE}"
        if [[ -f workspace.sh ]]; then
            source workspace.sh
        fi
    fi
}
