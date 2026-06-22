#!/bin/sh
# Cross-platform shell setup: editor/pager, shared home PATH, version manager
# (rbenv) and toolchains (Go, Rust, bun, Perl), direnv, colours, and GPG.

# --- Shell environment defaults ---

# Set Editor Editor to neovim if available, vim otherwise
if command -v nvim >/dev/null 2>&1; then
  _debug "setting editor to nvim"
  export EDITOR='nvim'
else
  _debug "setting editor to vim"
  export EDITOR='vim'
fi

# Default Pager
export PAGER="/usr/bin/less -isM"

# Set colors in Command line to true
CLICOLOR=True
export CLICOLOR

# generated using https://geoff.greer.fm/lscolors/
# go look at it
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="${LS_COLORS}:di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# disable default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# --- GnuPG / secrets ---

# gpg
export GPG_TTY
GPG_TTY=$(tty)

# pass & gopass should output ascii armoured instead of binary files
export PASSWORD_STORE_GPG_OPTS="--armor"
export GOPASS_GPG_OPTS=$PASSWORD_STORE_GPG_OPTS

# --- PATH & language toolchains ---
# Prepends accumulate, so the LAST line in this block lands FIRST in PATH.
# Ordered so ~/.bin and ~/.local/bin win over the toolchains, which win over
# Homebrew (set earlier in homebrew.osx.sh).

# GO (GOPATH shared; GOROOT, where needed, is set per-OS)
export GOPATH="$HOME/.gocode"
PATH="${PATH:+$GOPATH/bin:${PATH}}"

# rbenv (bin on PATH for all OSes; init if available)
PATH="${PATH:+$HOME/.rbenv/bin:${PATH}}"
if command -v rbenv >/dev/null 2>&1; then
  _debug "rbenv init"
  eval "$(rbenv init -)"
fi

# Perl local modules
if [ -f "$HOME/perl5/lib/perl5" ]; then
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

# --- Shell integrations ---

# direnv
if command -v direnv >/dev/null 2>&1 && is_zsh; then
  _debug "direnv init"
  eval "$(direnv hook zsh)"

fi
