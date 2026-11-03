#!/bin/sh
# Shared helpers. Every entry point sources this file before anything else.

ENV_DEBUG=${ENV_DEBUG:-false}

# ---------------------------------------------------------------------------
# Locate this dotfiles checkout.
# Override it if it chagnes
# ---------------------------------------------------------------------------
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"
export DOTFILES_DIR

_debug() {
  # Utility to print debug messages
  case "$ENV_DEBUG" in
  1 | true | TRUE)
    printf "%b" "$(date +%Y-%m-%dT%H:%M:%S%z) DEBUG "
    printf "%b" "$@"
    printf "%b" "\n"
    ;;
  *) ;;
  esac
}

src() {
  # Utility to import configuration files
  if [ "$1" ]; then
    source_file="$DOTFILES_DIR/environment/$1.sh"
    _debug "Importing $source_file"
    if [ -f "$source_file" ]; then
      # shellcheck source=./functions.sh
      . "$source_file"
    else
      echo "ERROR: $source_file does not exist"
    fi
  fi
}

# remove duplicates from path
# based on https://www.linuxjournal.com/content/removing-duplicate-path-entries
repath() {
  printf "%b" "$1" | awk -v RS=: -v len=0 '!($0 in a) {a[$0]; len++; printf("%s%s", len > 1 ? ":" : "", $0)}'
}

find_local_config() {
  find "${DOTFILES_DIR}/environment" -name '*.local.sh' -type f -print0 |
    xargs -0 -I @ sh -c "basename @" | sort
}

## session tests
is_interactive() {
  # true if session is interactive
  case $- in
  *i*)
    _debug "is_interactive"
    return 0
    ;;
  *) return 1 ;;
  esac
}

is_zsh_login() {
  # true if session is a zsh login shell, which has read ~/.zprofile.
  # zsh puts l in $- for login shells; bash never does.
  case $- in
  *l*)
    _debug "is_zsh_login"
    return 0
    ;;
  *) return 1 ;;
  esac
}

is_osx() {
  # return true if running in OSX
  case "$(uname)" in
  Darwin)
    _debug "is_osx"
    return 0
    ;;
  *) return 1 ;;
  esac
}

is_arm() {
  # return true if running on arm64
  case "$(/usr/bin/uname -m)" in
  arm64)
    _debug "is_arm"
    return 0
    ;;
  *) return 1 ;;
  esac
}

is_debian() {
  # return true if session is in Ubuntu, Debian or Raspbian
  case "$(cat /etc/issue 2>/dev/null)" in
  *Ubuntu* | *Debian* | *Raspbian*)
    _debug "is_debian"
    return 0
    ;;
  *) return 1 ;;
  esac
}
is_bash() {
  case "$(ps -p$$ -ocomm=)" in
  *bash)
    _debug "is_bash"
    return 0
    ;;
  *) return 1 ;;
  esac
}

is_zsh() {
  if [ -n "${ZSH_VERSION-}" ]; then
    _debug "is_zsh"
    return 0
  fi
  return 1
}

is_zim_loaded() {
  # true if zim has initialised this shell; its init.zsh defines zimfw
  command -v zimfw >/dev/null 2>&1
}

# profile.sh sources this file again, so shellcheck sees a second definition of
# _debug and is_zsh_login after the calls below and reports them as "only
# defined later". False positive: https://github.com/koalaman/shellcheck/issues/1595
# shellcheck disable=SC2218
reload_config() {
  _debug "Reloading profile.sh and shellrc.sh"
  if is_zsh_login; then
    # shellcheck source=./../profile.sh
    . "${DOTFILES_DIR}/profile.sh"
  fi
  # shellcheck source=./../shellrc.sh
  . "${DOTFILES_DIR}/shellrc.sh"
}
