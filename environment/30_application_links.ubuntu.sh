# Ubuntu only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# link sublimetext user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/sublimetext3/ $HOME/.config/sublime-text-3/Packages/User

# link subl utilty
ln -sfn /opt/sublime_text/sublime_text $HOME/.dotfiles/bin/subl