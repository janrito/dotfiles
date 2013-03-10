# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Homebrew bash completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# generic colourizer
source "`brew --prefix grc`/etc/grc.bashrc"