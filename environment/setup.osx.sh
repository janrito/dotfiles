#!/bin/sh
# macOS-only environment.
is_osx || return 1

# Setup fzf
if [ -d "$HOMEBREW_PREFIX/opt/fzf" ]; then
  _debug "fzf init"
  FZF_HOME="$HOMEBREW_PREFIX/opt/fzf"
  PATH="${PATH:+$FZF_HOME/bin:${PATH}}"
fi
