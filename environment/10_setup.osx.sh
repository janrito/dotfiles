#!/bin/bash

is_osx || return 1

# Paths in home directory
PATH="${PATH:+$HOME/.bin:$HOME/.local/bin:${PATH}}"

# Ruby
PATH="${PATH:+$HOME/.rbenv/bin:${PATH}}"

# NVM (Node Version Manager)
if [[ -f "$(brew --prefix)/opt/nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  source "$(brew --prefix)/opt/nvm/nvm.sh"
fi

# GO
export GOPATH=$HOME/.gocode
PATH="${PATH:+$GOPATH/bin:${PATH}}"


