is_osx || return 1

# Paths in home directory
export HOMEPATH=~/.bin:~/.local/bin

# Python 2
export PYTHON2PATH="/usr/local/opt/python@2/bin"
export VIRTUALENVWRAPPER_PYTHON=$PYTHON2PATH/python2

# Ruby
export RUBYPATH=$HOME/.rbenv/bin

# Haskell
export HASKELLPATH=~/.cabal/bin

# NVM (Node Version Manager)
if [[ -f /usr/local/opt/nvm/nvm.sh ]]; then
  export NVM_DIR="$HOME/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
fi

# GO
export GOPATH=$HOME/.gocode

# Homebrew
export BREWPATH=$GOPATH/bin:$RUBYPATH:$MMDS_PATH:$PYTHON2PATH:/usr/local/sbin:/usr/local/bin

# MacTex
export TEXPATH=/usr/texbin


# Export local path
export PATH=$HOMEPATH:$BREWPATH:$TEXPATH:$PATH