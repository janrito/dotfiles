#!/bin/sh
# Debian/Ubuntu/Raspbian-specific setup: npm-global, system Go (GOROOT), snap.
# Shared PATH/toolchain setup lives in setup.common.sh.
is_debian || return 1

# Node
if [ -e "$HOME/.npm-global" ]; then
  NPM_PATH="$HOME/.npm-global/bin"
  PATH="${PATH:+$NPM_PATH:${PATH}}"
  unset NPM_PATH
fi

# GO (GOROOT is Debian-specific; GOPATH/bin is set in setup.common.sh)
export GOROOT="/usr/local/go"
PATH="${PATH:+$GOROOT/bin:${PATH}}"
unset GOROOT

# Snap
PATH="${PATH:+/snap/bin:${PATH}}"
