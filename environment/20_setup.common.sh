
# Haskell
export HASKELLPATH=~/.cabal/bin

# Export local path
export PATH=:$HASKELLPATH:$PATH

#rbenv
if [[ "$(type -P rbenv)" ]]; then
     eval "$(rbenv init -)"
fi


if [[ "$(type -P subl)" ]]; then
  # Set Editor Editor to sublime if it exists
  export EDITOR='subl -w'
else
  # Set Editor Editor to vim
  export EDITOR='vim'
fi

# Set colors in Command line to true
CLICOLOR=True
export CLICOLOR

# load tmuxinator bash completion
if [[ -e ~/.bin/tmuxinator.bash ]]; then
  tmuxinator.bash
fi
