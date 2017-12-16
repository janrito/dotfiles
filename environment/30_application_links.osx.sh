is_interactive && is_osx || return 1

# link subl utilty
if [[ -e "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ]]; then
    ln -sfn "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" $HOME/.bin/subl
fi

