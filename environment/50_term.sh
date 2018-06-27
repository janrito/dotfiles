is_interactive || return 1

REPORTED_TERM=`infocmp | grep "^[^#;]" | head -1 | cut -d\| -f1`
if [ "$REPORTED_TERM" != "xterm-256color-italic" ] && [ "$REPORTED_TERM" != "tmux-256color" ]; then
    echo $REPORTED_TERM
    echo "Compiling terminfo"
    tic -x "${HOME}/.dotfiles/etc/xterm-256color-italic.terminfo"
    tic -x "${HOME}/.dotfiles/etc/tmux-256color.terminfo"
fi
