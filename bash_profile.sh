#!/bin/sh
# bash reads only this file at login, never ~/.bashrc.

# shellcheck source=./environment/lib.sh
. "${DOTFILES_DIR:-$HOME/.dotfiles}/environment/lib.sh"

if is_interactive; then
  # shellcheck source=./shellrc.sh
  . "$DOTFILES_DIR/shellrc.sh"
else
  # shellcheck source=./profile.sh
  . "$DOTFILES_DIR/profile.sh"
fi
