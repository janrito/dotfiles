#!/bin/sh
# Interactive setup, linked as ~/.zshrc.

# shellcheck source=./environment/lib.sh
. "${DOTFILES_DIR:-$HOME/.dotfiles}/environment/lib.sh"

# zsh login shells have already loaded the environment from ~/.zprofile
if ! is_zsh_login; then
  # shellcheck source=./profile.sh
  . "$DOTFILES_DIR/profile.sh"
fi

src "integrations"
src "term"
src "zimfw"
src "compinit-registrations"
src "starship"
src "zsh_keys"
src "functions"
src "aliases"
src "admin"
