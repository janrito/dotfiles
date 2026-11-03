#!/bin/sh
# Hooks and key bindings for interactive shells.

# gpg
export GPG_TTY
GPG_TTY=$(tty)

if is_zsh; then
  rc_shell=zsh
elif is_bash; then
  rc_shell=bash
else
  return 1
fi

# fzf completion and key bindings (fzf's bin is put on PATH in path.sh)
if is_osx && [ -d "$HOMEBREW_PREFIX/opt/fzf" ]; then
  _debug "fzf shell integration"
  FZF_HOME="$HOMEBREW_PREFIX/opt/fzf"
  # In zsh, ^R belongs to atuin (zim's atuin module); an empty value stops fzf
  # binding it, even when reload_config re-runs this file without zim.
  if is_zsh; then
    : "${FZF_CTRL_R_COMMAND=}"
  fi
  # shellcheck source=/dev/null
  . "$FZF_HOME/shell/completion.$rc_shell" 2>/dev/null
  # shellcheck source=/dev/null
  . "$FZF_HOME/shell/key-bindings.$rc_shell"
fi

# direnv
if command -v direnv >/dev/null 2>&1; then
  _debug "direnv init"
  eval "$(direnv hook "$rc_shell")"
fi

# fnox
if command -v fnox >/dev/null 2>&1; then
  _debug "fnox activate"
  eval "$(fnox activate "$rc_shell")"
fi
