#!/bin/sh

is_osx && is_zsh || return 1

__conda_setup="$("${HOMEBREW_PREFIX}/Caskroom/mambaforge/base/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"

# shellcheck disable=SC2181 # we need to check for the exit code, not the output
if [ $? -eq 0 ]; then
  _debug "conda setup"
  eval "$__conda_setup"
else
  if [ -f "${HOMEBREW_PREFIX}/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
    . "${HOMEBREW_PREFIX}/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
  else
    export PATH="${HOMEBREW_PREFIX}/Caskroom/mambaforge/base/bin:$PATH"
  fi
fi
unset __conda_setup

if [ -f "${HOMEBREW_PREFIX}/Caskroom/mambaforge/base/etc/profile.d/mamba.sh" ]; then
  . "${HOMEBREW_PREFIX}/Caskroom/mambaforge/base/etc/profile.d/mamba.sh"
fi
