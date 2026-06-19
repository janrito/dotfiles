#!/bin/sh

# needs path configuration
# shellcheck source=./../profile
. "${DOTFILES_DIR}/profile"

echo "SLEEPWATCHER $(date +%Y-%m-%dT%H:%M:%S%z): sleep"

# turn bluetooth off
"$(brew --prefix)/bin/blueutil" --power 0
