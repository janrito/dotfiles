#!/bin/sh
is_zsh || return 1

# zim initialises once per shell: its completion module runs compinit, which
# must not run twice (zim wiki, Troubleshooting)
if is_zim_loaded; then
  return 0
fi

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

# Exported so programs started from the shell, such as `just update zim`, find it.
export ZIM_HOME="$HOME/.zim"

# Download zimfw plugin manager if missing.
if [ ! -e "${ZIM_HOME}/zimfw.zsh" ]; then
  _debug "Downloading zimfw plugin manager."
  curl -fsSL --create-dirs -o "${ZIM_HOME}/zimfw.zsh" \
    "https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh"
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [ -z "$(find "${ZIM_HOME}/init.zsh" -newer "$HOME/.zimrc")" ]; then
  set -- "init" "-q"
  # zsh, outside this repo: shellcheck can neither find nor parse it
  # shellcheck source=/dev/null
  . "${ZIM_HOME}/zimfw.zsh"
  set --
fi
# Emacs keymap, set before the modules bind keys (zimfw's .zshrc template).
# Without it zsh picks vi, because ~/.zprofile sets EDITOR=nvim.
bindkey -e

# Initialize modules.
# zsh, outside this repo: shellcheck can neither find nor parse it
# shellcheck source=/dev/null
. "${ZIM_HOME}/init.zsh"
