#tmux powerline
if check_python && [[ -e "${PYTHON_PACKAGES}/powerline/bindings/bash/powerline.sh" ]]
  then
    . "${PYTHON_PACKAGES}/powerline/bindings/bash/powerline.sh"
fi
