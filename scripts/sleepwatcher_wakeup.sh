#!/bin/sh

# needs path configuration
# shellcheck source=./../profile
. "$HOME/.dotfiles/profile"

echo "SLEEPWATCHER $(date +%Y-%m-%dT%H:%M:%S%z): wakeup"

# turn bluetooth on
"$(brew --prefix)/bin/blueutil" --power 1

# connect to headphones, keyboard and trackpad

# 30-50-75-92-ca-f5 hdpn
# 64-a5-c3-f1-65-2e tkpd
# 70-f0-87-16-bd-aa kbrd

sleep 2 && "$(brew --prefix)/bin/blueutil" \
  --connect 30-50-75-92-ca-f5 \
  --connect 64-a5-c3-f1-65-2e \
  --connect 70-f0-87-16-bd-aa
