#!/bin/bash

# needs path configuration
source ~/.dotfiles/profile

# turn bluetooth on
$(brew --prefix)/bin/blueutil --power 1

# connect to headphones
sleep 2 && $(brew --prefix)/bin/blueutil --connect 30-50-75-93-9f-eb
