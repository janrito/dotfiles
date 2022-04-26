#!/bin/sh

ENV_DEBUG=${ENV_DEBUG:-false}

_debug() {
  # Utility to print debug messages
  case "$ENV_DEBUG" in
    1|true|TRUE)
      printf "%b" "$( date +%Y-%m-%dT%H:%M:%S%z ) DEBUG "
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
      # shellcheck source=./environment/00_functions.sh
     . "$source_file"
    else
      echo "ERROR: $source_file does not exist"
    fi
  fi
}

src "00_functions"
src "09_homebrew.osx"
src "10_setup.debian"
src "10_setup.osx"
src "20_setup.common"
src "30_application_links.debian"
src "30_application_links.osx"
src "40_zimfw"
src "45_starship"
src "50_term"
src "50_zsh_keys"
src "60_aliases"

for local_env_source_file in "$HOME/.dotfiles/environment/999"*
do
  # shellcheck source=./environment/00_functions.sh
  . "$local_env_source_file"
done

src "99_path_remove_duplicates"
