is_interactive && is_debian || return 1

# link subl utilty
if [[ -e /opt/sublime_text/sublime_text ]]; then
    ln -sfn /opt/sublime_text/sublime_text $HOME/.bin/subl
fi
