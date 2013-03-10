# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1


# Paths in home directory
export MATLABPATH=/Applications/MATLAB_R2012b.app/bin
export HOMEPATH=~/bin:$MATLABPATH


# Python
export PYTHONPATH=/usr/local/lib/python
export PYTHONBIN=/usr/local/share/python

# Ruby
export RUBYPATH=$HOME/.rbenv/bin

# Haskell
export HASKELLPATH=~/.cabal/bin

# Node.js
export NODE_PATH=/usr/local/lib/node_modules
export NODE_BINS=/usr/local/share/npm/bin:$NODE_PATH

# Mutlimarkdown support

export MMDS_PATH=/usr/local/Cellar/multimarkdown/3.6/Support

# Homebrew
export BREWPATH=$NODE_BINS:$HASKELLPATH:$RUBYPATH:$PYTHONBIN:$MMDS_PATH:/usr/local/sbin:/usr/local/bin

# MacTex
export TEXPATH=/usr/texbin


# Export local path
export PATH=$HOMEPATH:$BREWPATH:$TEXPATH:$PATH

#virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/share/python/virtualenvwrapper_lazy.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

#tmux powerline
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

#rbenv
eval "$(rbenv init -)"

# Editor
export EDITOR='subl -w'

# Colors
CLICOLOR=True
export CLICOLOR

# aliases
alias t=todo.sh
alias comatlab='matlab -nodisplay -nojvm'
alias pipu="pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 'LATEST:'"

# functions
function byw() { open -a /Applications/Byword.app "$@" ;}

# Homebrew bash completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# generic colourizer
source "`brew --prefix grc`/etc/grc.bashrc"
