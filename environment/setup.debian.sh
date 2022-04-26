#!/bin/sh

is_debian || return 1

# Paths in home directory
PATH="${PATH:+$HOME/.bin:$HOME/.local/bin:${PATH}}"

# Ruby
PATH="${PATH:+$HOME/.rbenv/bin:${PATH}}"

# Node
if [ -e "$HOME/.npm-global" ]; then
  NPM_PATH="$HOME/.npm-global/bin"
  PATH="${PATH:+$NPM_PATH:${PATH}}"
  unset NPM_PATH
fi

# GO
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.gocode/"
PATH="${PATH:+$GOPATH/bin:$GOROOT/bin:${PATH}}"
unset GOROOT
