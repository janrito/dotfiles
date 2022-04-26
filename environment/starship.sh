#!/bin/sh
is_zsh || return 1

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
