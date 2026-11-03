#!/bin/sh

# shellcheck source=./environment/lib.sh
. "${DOTFILES_DIR:-$HOME/.dotfiles}/environment/lib.sh"

src "homebrew.osx"
src "setup.debian"
src "setup.osx"
src "setup.common"
src "term"
src "zimfw"
src "compinit-registrations"
src "starship"
src "zsh_keys"
src "functions"
src "aliases"
src "admin"

# Find and import local configuration files
# Anything in environment/*.local.sh will be imported here
for local_env_source_file in $(find_local_config); do
  src "${local_env_source_file%.sh}"
done

# Remove duplicates from path
REPATHED_PATH=$(repath "$PATH")
export PATH="$REPATHED_PATH"
