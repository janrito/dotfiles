#!/bin/sh
# zsh completions that must load after zim's compinit (zimfw.sh).
is_zsh || return 1

# bun's _bun runs a bare compinit of its own when the completion system is not
# loaded yet, which audits fpath and prompts about directories it considers
# insecure.
if [ -s "$BUN_INSTALL/_bun" ]; then
  _debug "bun completions init"
  # shellcheck source=/dev/null
  . "$BUN_INSTALL/_bun"
fi
