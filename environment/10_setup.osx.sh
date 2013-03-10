# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1


# Paths in home directory
export MATLABPATH=/Applications/MATLAB_R2012b.app/bin
export HOMEPATH=~/bin:$MATLABPATH


# Python
export PYTHONPATH=/usr/local/lib/python
export PYTHONBIN=/usr/local/share/python

export PYTHON_PACKAGES=/usr/local/lib/python2.7/site-packages

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



#tmux powerline
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

#rbenv
eval "$(rbenv init -)"

# Editor
export EDITOR='subl -w'

# Colors
CLICOLOR=True
export CLICOLOR


# functions
function byw() { open -a /Applications/Byword.app "$@" ;}


