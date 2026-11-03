#!/bin/sh
# PATH and the toolchains that add to it. Prepends accumulate, so the LAST
# entry lands FIRST in PATH: platform directories, then toolchains, then
# ~/.bin and ~/.local/bin, which win over everything, including Homebrew (set
# earlier in homebrew.sh).

# --- Debian, Ubuntu, Raspbian ---
if is_debian; then
  # Node
  if [ -e "$HOME/.npm-global" ]; then
    NPM_PATH="$HOME/.npm-global/bin"
    PATH="${PATH:+$NPM_PATH:${PATH}}"
    unset NPM_PATH
  fi

  # Go, installed in /usr/local/go
  PATH="${PATH:+/usr/local/go/bin:${PATH}}"

  # Snap
  PATH="${PATH:+/snap/bin:${PATH}}"
fi

# --- macOS ---
# fzf; its completion and key bindings live in integrations.sh
if is_osx && [ -d "$HOMEBREW_PREFIX/opt/fzf" ]; then
  _debug "fzf init"
  FZF_HOME="$HOMEBREW_PREFIX/opt/fzf"
  PATH="${PATH:+$FZF_HOME/bin:${PATH}}"
fi

# --- Toolchains, all platforms ---

# Go workspace (Debian's system Go is added above)
export GOPATH="$HOME/.gocode"
PATH="${PATH:+$GOPATH/bin:${PATH}}"

# rbenv (bin on PATH for all OSes; init if available)
PATH="${PATH:+$HOME/.rbenv/bin:${PATH}}"
if command -v rbenv >/dev/null 2>&1; then
  _debug "rbenv init"
  eval "$(rbenv init -)"
fi

# Perl local modules
if [ -d "$HOME/perl5/lib/perl5" ]; then
  _debug "perl5 init"
  eval "$(perl -I"$HOME/perl5/lib/perl5" -Mlocal::lib)"
fi

# Rust / Cargo
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"

if [ -f "$CARGO_HOME/env" ]; then
  _debug "Cargo init"
  # shellcheck source=/dev/null
  . "$CARGO_HOME/env"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Home directories last → highest precedence (your own scripts win)
PATH="${PATH:+$HOME/.bin:$HOME/.local/bin:${PATH}}"
