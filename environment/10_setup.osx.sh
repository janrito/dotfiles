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


# Setup fzf
if [[ -d "$(brew --prefix)/opt/fzf" ]]; then
  FZF_HOME="$(brew --prefix)/opt/fzf"
  PATH="${PATH:+$FZF_HOME/bin${PATH}}"

  if is_bash; then
    if is_interactive; then
      source "$FZF_HOME/shell/completion.bash" 2> /dev/null
    fi
    source "$FZF_HOME/shell/key-bindings.bash"
  elif is_zsh; then
    if is_interactive; then
      source "$FZF_HOME/shell/completion.zsh" 2> /dev/null
    fi
    source "$FZF_HOME/shell/key-bindings.zsh"
  fi

fi
