is_osx || return 1

# Homebrew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  # default os-x bash 3
  source $(brew --prefix)/etc/bash_completion
elif [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  # homebrew installed bash 4
  source $(brew --prefix)/share/bash-completion/bash_completion
fi

# generic colourizer
if [ -f $(brew --prefix)/etc/grc.bashrc ]; then
  source $(brew --prefix)/etc/grc.bashrc
fi
