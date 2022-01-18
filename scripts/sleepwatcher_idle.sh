#!/bin/bash

# needs path configuration
# shellcheck source=profile
source "$HOME/.dotfiles/profile"

echo "SLEEPWATCHER $(date +%Y-%m-%dT%H:%M:%S%z): idle"

# # turn bluetooth off
# "$(brew --prefix)/bin/blueutil" --power 0
