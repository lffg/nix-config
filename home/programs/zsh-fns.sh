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

DEFAULT_PG_INIT_DATA_DIR="$HOME/.temp/pg"
export PGDATA="${PGDATA:-$DEFAULT_PG_INIT_DATA_DIR}"

pg_init() {
    local DATA_DIR="$DEFAULT_PG_INIT_DATA_DIR"

    if [ "$DATA_DIR" != "$PGDATA" ]; then
        >&2 echo "[pg_init] unexpected \`PGDATA\`"
        return
    fi

    if [ ! -d "$DATA_DIR" ]; then
        >&2 echo "[pg_init] unitialized database directory, initializing it..."
        mkdir -p "$DATA_DIR"
        pg_ctl init
    fi

    if pg_ctl status; then
        >&2 echo "[pg_init] pg already running"
        return
    fi

    export PGDATA="$DATA_DIR"
    pg_ctl start
}

rw() {
    if ! first=$(which "$1"); then
        >&2 echo "$first"
        return 1
    fi
    realpath "$first"
}
