#!/bin/sh

ENV_DEBUG=${ENV_DEBUG:-false}

_debug() {
  case "$ENV_DEBUG" in
    1|true|TRUE)
      printf "%b" "$@"
      printf "%b" "\n"
      ;;
    *) ;;
  esac
}

# Source all files in ~/.dotfiles/environment/
src() {
  if [ "$1" ]; then
    echo "$1"
    # shellcheck source=environment/00_functions.sh
    . "$HOME/.dotfiles/environment/$1.sh"
  else
    for env_source_file in "$HOME/.dotfiles/environment/"*
    do
      _debug ". $env_source_file"
      # shellcheck source=environment/00_functions.sh
      . "$env_source_file"
    done

  fi
}

src "$@"
