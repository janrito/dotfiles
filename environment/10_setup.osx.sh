# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1


# Paths in home directory
export MATLABPATH=/Applications/MATLAB_R2012b.app/bin
export HOMEPATH=~/.bin:$MATLABPATH


# Python
export PYTHONPATH=/usr/local/lib/python

export PYTHON_PACKAGES=/usr/local/lib/python2.7/site-packages

# Ruby
export RUBYPATH=$HOME/.rbenv/bin

# Haskell
export HASKELLPATH=~/.cabal/bin

# Node.js
export NODE_PATH=/usr/local/lib/node_modules
export NODE_BINS=/usr/local/share/npm/bin:$NODE_PATH

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home"

# Mutlimarkdown support

export MMDS_PATH=/usr/local/Cellar/multimarkdown/4.5.3/Support

# Homebrew
export BREWPATH=$NODE_BINS:$RUBYPATH:$MMDS_PATH:/usr/local/sbin:/usr/local/bin

# Homebrew Cask
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

# MacTex
export TEXPATH=/usr/texbin


# Export local path
export PATH=$HOMEPATH:$BREWPATH:$TEXPATH:$PATH

#bash completion for password store
if [[ -e /usr/local/etc/bash_completion.d/password-store ]]; then
    source /usr/local/etc/bash_completion.d/password-store
fi
