#!/bin/sh

ENV_DEBUG=${ENV_DEBUG:-false}

_debug() {
  # Utility to print debug messages
  case "$ENV_DEBUG" in
  1 | true | TRUE)
    printf "%b" "$(date +%Y-%m-%dT%H:%M:%S%z) DEBUG "
    printf "%b" "$@"
    printf "%b" "\n"
    ;;
  *) ;;
  esac
}

src() {
  # Utility to import configuration files
  if [ "$1" ]; then
    source_file="$HOME/.dotfiles/environment/$1.sh"
    _debug "Importing $source_file"
    if [ -f "$source_file" ]; then
      # shellcheck source=./environment/functions.sh
      . "$source_file"
    else
      echo "ERROR: $source_file does not exist"
    fi
  fi
}

src "functions"
src "homebrew.osx"
src "setup.debian"
src "setup.osx"
src "setup.common"
src "conda.osx"
src "zimfw"
src "starship"
src "term"
src "zsh_keys"
src "aliases"

# Find and import local configuration files
# Anything in environment/*.local.sh will be imported here
for local_env_source_file in $(find_local_config); do
  src "${local_env_source_file%.sh}"
done

# Remove duplicates from path
REPATHED_PATH=$(repath "$PATH")
export PATH="$REPATHED_PATH"
