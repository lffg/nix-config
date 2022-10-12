#!/usr/bin/env bash

# Load secrets
if [ -e ~/.env.sh ]; then
  # shellcheck disable=SC1090
  . ~/.env.sh
fi

fix_home_manager_path_priority() {
  local flake_path=""
  local rest_path=""

  IFS=':' read -r -A path_entries <<< "$PATH"
  for entry in "${path_entries[@]}"; do
    if [[ $entry == "/nix/store/"* ]]; then
      flake_path+="${flake_path:+:}$entry"
    else
      rest_path+="${rest_path:+:}$entry"
    fi
  done

  export PATH="$flake_path:$rest_path"
}

[ -n "$IN_NIX_SHELL" ] && fix_home_manager_path_priority

# shellcheck disable=SC1091
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

export DIRENV_LOG_FORMAT=''
eval "$(direnv hook zsh)"
