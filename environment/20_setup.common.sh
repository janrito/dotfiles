# Set Editor Editor to vim
export EDITOR='vim'

# Default Pager
export PAGER="/usr/bin/less -isM"

#rbenv
if [[ "$(type -P rbenv)" ]]; then
     eval "$(rbenv init -)"
fi

# Set colors in Command line to true
CLICOLOR=True
export CLICOLOR
