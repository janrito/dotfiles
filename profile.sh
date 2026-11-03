#!/bin/sh
# Environment for login shells, linked as ~/.zprofile, so GUI apps that run
# $SHELL -l get it too. Keep it POSIX sh: zsh and bash both source it.

# shellcheck source=./environment/lib.sh
. "${DOTFILES_DIR:-$HOME/.dotfiles}/environment/lib.sh"

src "homebrew.osx"
src "path"
src "defaults"

# Find and import local configuration files
# Anything in environment/*.local.sh will be imported here
for local_env_source_file in $(find_local_config); do
  src "${local_env_source_file%.sh}"
done

# Remove duplicates from path
REPATHED_PATH=$(repath "$PATH")
export PATH="$REPATHED_PATH"
