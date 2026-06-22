#!/bin/sh
is_zsh || return 1
is_interactive || return 1

# Completion registrations (compdef-style) that must be sourced AFTER the
# completion system is initialised. zim runs `compinit` (in zimfw.sh); this file
# is sourced after it, so tools like bun's _bun skip their own bare `compinit`
# (which would audit fpath and prompt about insecure directories — e.g.
# admin-owned Homebrew dirs on macOS, or other non-user-owned dirs on Linux).
# This file does not run compinit itself.

if [ -s "$BUN_INSTALL/_bun" ]; then
  _debug "bun completions init"
  # shellcheck source=/dev/null
  . "$BUN_INSTALL/_bun"
fi
