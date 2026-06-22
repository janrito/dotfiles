#!/bin/sh
# Privilege escalation: run commands as the admin user (su) or root (sudo).

# user to escalate to; override per-machine in environment/*.local.sh
: "${ASADMIN_USER:=administrator}"

# Run a command as the admin user, in that user's own interactive login shell
# so their shell init (.zshrc/.bashrc) is sourced. The caller's argv is passed
# as a clean vector via "$@", so quoted arguments with spaces survive intact,
# and the working directory and environment are preserved (no -l/login).
#
# macOS (BSD su) forwards -i/-c to the target user's shell directly.
# Debian (util-linux su) needs `--` so su stops parsing its own options and
# forwards the rest to the shell. The two forms are mutually exclusive, hence
# the branch on is_osx.
#
# A leading `--` switches to command-line mode: everything after it is run as a
# shell command line in the admin shell, so &&, pipes, redirection, and admin
# aliases work (quote the whole line as one argument, as with sh -c). Without
# `--`, arguments are passed through verbatim (quoting-safe). Thus
# `asadmin foo bar` and `asadmin -- "foo bar"` are equivalent for a simple
# command.
asadmin() {
  if [ "${1-}" = "--" ]; then
    shift
    if is_osx; then
      su "$ASADMIN_USER" -i -c "$*"
    else
      su "$ASADMIN_USER" -- -i -c "$*"
    fi
  else
    if is_osx; then
      su "$ASADMIN_USER" -i -c '"$@"' sh "$@"
    else
      su "$ASADMIN_USER" -- -i -c '"$@"' sh "$@"
    fi
  fi
}

# Run a command as root, via the admin user's sudo. A leading `--` runs the rest
# as a shell command line as root (no nested quoting); otherwise argv mode.
asroot() {
  if [ "${1-}" = "--" ]; then
    shift
    asadmin sudo sh -c "$*"
  else
    asadmin sudo "$@"
  fi
}

# Fix ownership of the given path(s) to the brew/admin user, recursively.
#   adminchown /Applications/Claude.app /Applications/Spotify.app
adminchown() { asroot chown -R "${ASADMIN_USER}:staff" "$@"; }
