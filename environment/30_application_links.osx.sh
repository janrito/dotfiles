# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# link sublimetext user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/sublimetext2/ $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages/User

# link sublimetext user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/sublimetext3/ $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# link Mou user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/Mou/ $HOME/Library/Application\ Support/Mou

# link TaskPaper user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/TaskPaperThemes/ $HOME/Library/Application\ Support/TaskPaper/Themes

# functions
function byw() { open -a /Applications/Byword.app "$@" ;}
