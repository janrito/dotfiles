# Set Editor Editor to vim
export EDITOR='vim'

# Default Pager
export PAGER="/usr/bin/less -isM"
>>>>>>> 9ac93131d1d710b221c5dff6c2a9e25650689c33

# Haskell
export HASKELLPATH=~/.cabal/bin

# Export local path
export PATH=:$HASKELLPATH:$PATH

#rbenv
if [[ "$(type -P rbenv)" ]]; then
     eval "$(rbenv init -)"
fi

# Set colors in Command line to true
CLICOLOR=True
export CLICOLOR

# tmuxinator bash completion
if [[ -e ~/.bin/tmuxinator.bash ]]; then
    source ~/.bin/tmuxinator.bash
fi
