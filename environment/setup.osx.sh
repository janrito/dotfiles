#!/bin/sh

is_osx || return 1

# Paths in home directory
PATH="${PATH:+$HOME/.bin:$HOME/.local/bin:${PATH}}"

# Ruby
PATH="${PATH:+$HOME/.rbenv/bin:${PATH}}"

# NVM (Node Version Manager)
if [ -f "$(brew --prefix)/opt/nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  _debug "NVM init"
  # we can ignore this becasuse we are checking it exists
  # shellcheck source=opt/nvm/nvm.sh
  . "$(brew --prefix)/opt/nvm/nvm.sh"
  unset NVM_DIR
fi

# GO
_debug "GO init"
export GOPATH="$HOME/.gocode"
PATH="${PATH:+$GOPATH/bin:${PATH}}"

# Setup fzf
if [ -d "$(brew --prefix)/opt/fzf" ]; then
  _debug "fzf init"
  FZF_HOME="$(brew --prefix)/opt/fzf"
  PATH="${PATH:+$FZF_HOME/bin${PATH}}"

  if is_zsh; then
    if is_interactive; then
      # we can ignore SC1094 because we know it's zsh
      # shellcheck source=opt/fzf/shell/completion.zsh disable=SC1094
      . "$FZF_HOME/shell/completion.zsh" 2>/dev/null
    fi
    # we can ignore SC1094 because we know it's zsh
    # shellcheck source=opt/fzf/shell/key-bindings.zsh disable=SC1094
    . "$FZF_HOME/shell/key-bindings.zsh"
  fi
fi
