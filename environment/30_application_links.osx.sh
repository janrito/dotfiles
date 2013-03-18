# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# link sublimetext user directory to the dotfiles repo
ln -sf ~/.dotfiles/preferences/sublimetext2 ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User