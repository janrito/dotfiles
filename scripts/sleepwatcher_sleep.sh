#!/bin/bash

# needs path configuration
source ~/.dotfiles/profile

echo "SLEEPWATCHER $(date +%Y-%m-%dT%H:%M:%S%z): sleep"

# turn bluetooth off
"$(brew --prefix)/bin/blueutil" --power 0
