is_osx || return 1

# Paths in home directory
export HOMEPATH=~/.bin:~/.local/bin

# Ruby
export RUBYPATH=$HOME/.rbenv/bin

# NVM (Node Version Manager)
if [[ -f "$(brew --prefix)/opt/nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  source "$(brew --prefix)/opt/nvm/nvm.sh"
fi

# GO
export GOPATH=$HOME/.gocode

# Homebrew
export BREWPATH=$GOPATH/bin:$RUBYPATH

# Export local path
export PATH=$HOMEPATH:$BREWPATH:$PATH