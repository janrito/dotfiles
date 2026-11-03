#!/bin/sh

if command -v starship >/dev/null 2>&1; then
  if is_zsh; then
    eval "$(starship init zsh)"
  elif is_bash; then
    eval "$(starship init bash)"
  fi
fi
