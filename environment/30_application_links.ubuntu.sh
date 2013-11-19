# Ubuntu only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# link sublimetext user directory to the dotfiles repo
ln -sfn $HOME/.dotfiles/preferences/sublimetext2/ $HOME/.config/sublime-text-2/User

