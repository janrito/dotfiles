is_osx || return 1

# Homebrew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# generic colourizer
if [ -f $(brew --prefix)/etc/grc.bashrc ]; then
  . $(brew --prefix)/etc/grc.bashrc
fi
