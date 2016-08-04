# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1


# Paths in home directory
export HOMEPATH=~/.bin


# Python
export PYTHONPATH=/usr/local/lib/python

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
if [[ -e /Developer/NVIDIA/CUDA-7.5/bin/ ]]; then
    PATH=/Developer/NVIDIA/CUDA-7.5/bin:$PATH
    export LD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.5/lib/:$LD_LIBRARY_PATH
    export CUDA_ROOT=/Developer/NVIDIA/CUDA-7.5/
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

#bash completion for password store
if [[ -e /usr/local/etc/bash_completion.d/password-store ]]; then
    source /usr/local/etc/bash_completion.d/password-store
fi
