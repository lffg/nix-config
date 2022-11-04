#!/usr/bin/env bash

yarn_commands=("glob-cli" "trash trash-cli")
to_install=()

for raw in "${yarn_commands[@]}"; do
    read -r cmd pkg <<< "$raw"
    pkg="${pkg:-$cmd}"

    ! command -v "$cmd" &> /dev/null \
        && to_install+=("$pkg")
done

[ "${#to_install[@]}" != 0 ] \
    && yarn global add "${to_install[@]}" \
    || echo "all yarn pkgs installed"
