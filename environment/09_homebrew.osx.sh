#!/bin/bash

is_osx || return 1

# homebrew on arm
if is_arm; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

if [ -f "${HOMEBREW_PREFIX}/bin/brew" ]; then
  eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
fi

if is_bash; then
  # Homebrew bash completion
  if [ -f "$HOMEBREW_PREFIX/etc/bash_completion" ]; then
    # default os-x bash 3
    source "$HOMEBREW_PREFIX/etc/bash_completion"
  elif [ -f "$HOMEBREW_PREFIX/share/bash-completion/bash_completion" ]; then
    # homebrew installed bash 4
    source "$HOMEBREW_PREFIX/share/bash-completion/bash_completion"
  fi
elif is_zsh; then
  # Homebrew zsh completion
  FPATH=$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH
fi

# default homebrew bundle file
export HOMEBREW_BUNDLE_FILE="${HOME}/.config/brewfile/Brewfile"