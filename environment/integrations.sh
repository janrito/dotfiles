#!/bin/sh
# Hooks and key bindings for interactive shells.

# gpg
export GPG_TTY
GPG_TTY=$(tty)

# fzf completion and key bindings (fzf's bin is put on PATH in setup.osx.sh)
if is_osx && is_zsh && [ -d "$HOMEBREW_PREFIX/opt/fzf" ]; then
  _debug "fzf shell integration"
  FZF_HOME="$HOMEBREW_PREFIX/opt/fzf"
  # we can ignore SC1094 because we know it's zsh
  # shellcheck source=opt/fzf/shell/completion.zsh disable=SC1094
  . "$FZF_HOME/shell/completion.zsh" 2>/dev/null
  # we can ignore SC1094 because we know it's zsh
  # shellcheck source=opt/fzf/shell/key-bindings.zsh disable=SC1094
  . "$FZF_HOME/shell/key-bindings.zsh"
fi

# direnv
if command -v direnv >/dev/null 2>&1 && is_zsh; then
  _debug "direnv init"
  eval "$(direnv hook zsh)"

fi

# fnox
if command -v fnox >/dev/null 2>&1 && is_zsh; then
  _debug "fnox activate"
  eval "$(fnox activate zsh)"
fi
