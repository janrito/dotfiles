#!/bin/sh
# Homebrew (macOS).
# Must precede setup.osx.sh, which calls `brew --prefix` for fzf.
is_osx || return 1

# homebrew on arm
if is_arm; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

# brew shellenv also adds Homebrew's zsh completions to fpath
if [ -f "${HOMEBREW_PREFIX}/bin/brew" ]; then
  eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
fi

# default homebrew bundle file
export HOMEBREW_BUNDLE_FILE="${DOTFILES_DIR}/brewfile/Brewfile"
