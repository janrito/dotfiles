#tmux powerline
if [[ -e "${PYTHON_PACKAGES}/powerline/bindings/bash/powerline.sh" ]]
  then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . "${PYTHON_PACKAGES}/powerline/bindings/bash/powerline.sh"
fi
