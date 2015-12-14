# Ubuntu only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# link subl utilty
ln -sfn /opt/sublime_text/sublime_text $HOME/.dotfiles/bin/subl