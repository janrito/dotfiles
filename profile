#!/bin/bash

# inspired by https://github.com/cowboy/dotfiles/blob/master/link/.bashrc

# Source all files in ~/.dotfiles/environment/
function src() {
  local file
  if [[ "$1" ]]; then
    echo "$1"
    # shellcheck source=environment/00_functions.sh
    source "$HOME/.dotfiles/environment/$1.sh"
  else
    for file in ~/.dotfiles/environment/*; do
      # shellcheck source=environment/00_functions.sh
      source "$file"
    done
  fi
}

src "$@"
