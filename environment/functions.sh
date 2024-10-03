#!/bin/sh

reload_config() {
  if [ -f "${HOME}/.dotfiles/profile" ]; then
    _debug "Reloading profile"
    # shellcheck source=./../profile
    . "$HOME/.dotfiles/profile"
  fi
}

# remove duplicates from path
# based on https://www.linuxjournal.com/content/removing-duplicate-path-entries
repath() {
  printf "%b" "$1" | awk -v RS=: -v len=0 '!($0 in a) {a[$0]; len++; printf("%s%s", len > 1 ? ":" : "", $0)}'
}

# pretty print path
path() {
  echo "$PATH" | awk 'BEGIN{RS=":"}{$1=$1}1'
}

find_local_config() {
  find "$HOME/.dotfiles/environment" -name '*.local.sh' -type f -print0 |
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

## based on https://github.com/kennethreitz/dotfiles/blob/master/.aliases
battery() {
  pmset -g batt | grep -E "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'
  pmset -g batt | grep -E "([0-9]+\%).*" -o --colour=auto | cut -f3 -d';'
}

ss() {
  open -a ScreenSaverEngine
}

lock() {
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
}

pyc() {
  find . -name "*.pyc" -delete
}
