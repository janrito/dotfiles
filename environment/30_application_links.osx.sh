# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# link sublimetext user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/sublimetext2/ $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages/User

# functions
function byw() { open -a /Applications/Byword.app "$@" ;}
