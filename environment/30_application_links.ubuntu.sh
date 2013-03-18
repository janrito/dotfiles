# Ubuntu-only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# link sublimetext user directory to the dotfiles repo
ln -sfv ~/.dotfiles/preferences/sublimetext2 ~/.config/sublime-text-2/User

