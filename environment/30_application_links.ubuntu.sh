# Ubuntu only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# link subl utilty
if [[ -e /opt/sublime_text/sublime_text ]]; then
    ln -sfn /opt/sublime_text/sublime_text $HOME/.bin/subl
fi
