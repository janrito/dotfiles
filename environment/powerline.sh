is_interactive || return 1
# powerline

export POWERLINE_BINDINGS=$(_find_powerline_bindings)

if [[ -e "${POWERLINE_BINDINGS}/bash/powerline.sh" ]]
  then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source "${POWERLINE_BINDINGS}/bash/powerline.sh"
fi
