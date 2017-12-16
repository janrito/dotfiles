is_osx || return 1

# Paths in home directory
export HOMEPATH=~/.bin


# Python
export PYTHONPATH=/usr/local/lib/python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2

# Ruby
export RUBYPATH=$HOME/.rbenv/bin

# Haskell
export HASKELLPATH=~/.cabal/bin

# Node.js
export NODE_PATH=/usr/local/lib/node_modules
export NODE_BINS=/usr/local/share/npm/bin:$NODE_PATH

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home"

# CUDA
if [[ -e /usr/local/cuda ]]; then
    export CUDA_HOME=/usr/local/cuda
    export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
    PATH="$CUDA_HOME/bin:$PATH"
    export THEANO_FLAGS='mode=FAST_RUN,device=gpu,floatX=float32'
fi


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