#!/bin/sh

# needs path configuration
# shellcheck source=./../profile
. "$HOME/.dotfiles/profile"

echo "SLEEPWATCHER $(date +%Y-%m-%dT%H:%M:%S%z): idleresume"

# # turn bluetooth on
# "$(brew --prefix)/bin/blueutil" --power 1

# # connect to headphones, keyboard and trackpad
# sleep 2 && "$(brew --prefix)/bin/blueutil" \
#     --connect 30-50-75-93-9f-eb \
#     --connect 64-a5-c3-f1-65-2e \
#     --connect 70-f0-87-16-bd-aa
