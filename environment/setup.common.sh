#!/bin/sh

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

# direnv
if command -v direnv >/dev/null 2>&1 && is_zsh; then
  _debug "direnv init"
  eval "$(direnv hook zsh)"

fi

#rbenv
if command -v rbenv >/dev/null 2>&1; then
  _debug "rbenv init"
  eval "$(rbenv init -)"
fi

# pyenv
if [ -f "$HOME/.pyenv/bin/pyenv" ]; then
  _debug "pyenv init"
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Perl local modules
if [ -f "$HOME/perl5/lib/perl5" ]; then
  _debug "perl5 init"
  eval "$(perl -I"$HOME/perl5/lib/perl5" -Mlocal::lib)"
fi

# Set colors in Command line to true
CLICOLOR=True
export CLICOLOR

# generated using https://geoff.greer.fm/lscolors/
# go look at it
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="${LS_COLORS}:di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# disable default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# pass & gopass should output ascii armoured instead of binary files
export PASSWORD_STORE_GPG_OPTS="--armor"
export GOPASS_GPG_OPTS=$PASSWORD_STORE_GPG_OPTS

# gpg
export GPG_TTY
GPG_TTY=$(tty)
