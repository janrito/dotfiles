#!/bin/sh
is_zsh || return 1

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

ZIM_HOME="${ZDOTDIR:-${HOME}}/.zim"

# Download zimfw plugin manager if missing.
if [ ! -e "${ZIM_HOME}/zimfw.zsh" ]; then
  _debug "Downloading zimfw plugin manager."
  curl -fsSL --create-dirs -o "${ZIM_HOME}/zimfw.zsh" \
      "https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh"
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [ -z "$(find "${ZIM_HOME}/init.zsh" -newer "${ZDOTDIR:-${HOME}}/.zimrc")" ]; then
  set -- "init" "-q"
  # shellcheck source=./../../../../.zim/zimfw.zsh
  . "${ZIM_HOME}/zimfw.zsh"
  set --
fi
# Initialize modules.
# shellcheck source=./../../.zim/init.zsh
. "${ZIM_HOME}/init.zsh"