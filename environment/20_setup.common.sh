# Set Editor Editor to vim
export EDITOR='vim'

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
