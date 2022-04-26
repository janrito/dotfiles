#!/bin/sh

is_osx && is_zsh || return 1

__conda_setup="$("${HOMEBREW_PREFIX}/Caskroom/miniforge/base/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"

if [ "$__conda_setup" ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOMEBREW_PREFIX}/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "${HOMEBREW_PREFIX}/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="${HOMEBREW_PREFIX}/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "${HOMEBREW_PREFIX}/Caskroom/miniforge/base/etc/profile.d/mamba.sh" ]; then
    . "${HOMEBREW_PREFIX}/Caskroom/miniforge/base/etc/profile.d/mamba.sh"
fi
