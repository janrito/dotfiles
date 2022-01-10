#!/bin/bash

is_debian || return 1

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if is_bash; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

# Paths in home directory
PATH="${PATH:+$HOME/.bin:$HOME/.local/bin:${PATH}}"

# Ruby
PATH="${PATH:+$HOME/.rbenv/bin:${PATH}}"

# Node
if [[ -e $HOME/.npm-global ]]; then
  NPM_PATH=$HOME/.npm-global/bin
  PATH="${PATH:+$NPM_PATH:${PATH}}"
fi

# GO
export GOROOT=/usr/local/go
export GOPATH=$HOME/.gocode/
PATH="${PATH:+$GOPATH/bin:$GOROOT/bin:${PATH}}"


if is_bash; then
  # sudo tab completion
  complete -cf sudo

  # setup bash completion
  if [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi

  # gopass bash completion
  if command -v gopass &> /dev/null; then
    source <(gopass completion bash)
  fi
fi
