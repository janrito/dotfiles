# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# link sublimetext user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/sublimetext3/ $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# link subl utilty
ln -sfn "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" $HOME/.dotfiles/bin/subl

# link Mou user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/Mou/ $HOME/Library/Application\ Support/Mou

# link TaskPaper user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/TaskPaperThemes/ $HOME/Library/Application\ Support/TaskPaper/Themes

# functions
function byw() { open -a /Applications/Byword.app "$@" ;}
