#!/bin/sh
# Core library: dotfiles-framework helpers (reload_config, repath,
# find_local_config) and platform/shell detection predicates (is_*).
# Sourced first — everything else depends on these.

reload_config() {
  if [ -f "${DOTFILES_DIR}/profile" ]; then
    _debug "Reloading profile"
    # shellcheck source=./../profile
    . "${DOTFILES_DIR}/profile"
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
  case "$(ps -p$$ -ocomm=)" in
  *zsh)
    _debug "is_zsh"
    return 0
    ;;
  *) return 1 ;;
  esac
}
