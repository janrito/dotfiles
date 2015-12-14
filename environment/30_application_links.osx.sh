# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# link subl utilty
ln -sfn "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" $HOME/.dotfiles/bin/subl