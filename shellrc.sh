#!/bin/sh
# Interactive setup for zsh and bash, linked as ~/.zshrc and ~/.bashrc.

# shellcheck source=./environment/lib.sh
. "${DOTFILES_DIR:-$HOME/.dotfiles}/environment/lib.sh"

# zsh login shells have already loaded the environment from ~/.zprofile
if ! is_zsh_login; then
  # shellcheck source=./profile.sh
  . "$DOTFILES_DIR/profile.sh"
fi

src "integrations"
src "zimfw"
src "completions"
src "starship"
src "zsh_keys"
src "functions"
src "aliases"
src "admin"
