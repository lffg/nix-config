#!/usr/bin/env bash

gcp-c() {
    local CONFIG="${1:-default}"
    gcloud config configurations activate "$CONFIG"
}

gcp() {
    local SUB_COMMAND=$1
    local ARGS=("${@:2}")

    case "$SUB_COMMAND" in
        c) gcp-c "${ARGS[@]}" ;;
        *) >&2 echo "error: $SUB_COMMAND: invalid sub command" ;;
    esac
}

rw() {
    if ! first=$(which "$1"); then
        >&2 echo "$first"
        return 1
    fi
    realpath "$first"
}
