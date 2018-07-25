is_interactive || return 1

REPORTED_TERM=`infocmp -1 | grep 'sitm=\\\\E\[3m,\\|ritm=\\\\E\\[23m,' | wc -l | tr -d '[:space:]'`
if [ "$REPORTED_TERM" != "2" ]; then
    echo $REPORTED_TERM
    echo "Compiling terminfo"
    tic -x "${HOME}/.dotfiles/etc/xterm-256color.terminfo"
    tic -x "${HOME}/.dotfiles/etc/tmux-256color.terminfo"
fi
