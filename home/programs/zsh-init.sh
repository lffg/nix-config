# Load secrets.
if [ -e ~/.env.sh ]; then
  . ~/.env.sh
fi

. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

export DIRENV_LOG_FORMAT=''
eval "$(direnv hook zsh)"
