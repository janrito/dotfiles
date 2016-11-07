
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

BASE16_SHELL=$HOME/.dotfiles/vendor/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# tmuxinator bash completion
if [[ -e ~/.bin/tmuxinator.bash ]]; then
    source ~/.bin/tmuxinator.bash
fi
