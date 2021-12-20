#!/bin/bash

reload_config() {
  source "${HOME}/.dotfiles/profile"
}

# remove duplicates from path
# based on https://www.linuxjournal.com/content/removing-duplicate-path-entries
repath() {
  echo -n "$1" | awk -v RS=: -v len=0 '!($0 in a) {a[$0]; len++; printf("%s%s", len > 1 ? ":" : "", $0)}'
}

# pretty print path
path() {
  echo "$PATH" | awk 'BEGIN{RS=":"}{$1=$1}1'
}


## session tests
is_interactive() {
  # true if session is interactive
  [[ $- == *i* ]] || return 1
}

is_osx() {
  # return true if running in OSX
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

is_arm() {
  # return true if running on arm64
  local UNAME_MACHINE
  UNAME_MACHINE="$(/usr/bin/uname -m)"
  [[ "$UNAME_MACHINE" == "arm64" ]] || return 1
}

is_debian() {
  # return true if session is in Ubuntu, Debian or Raspbian
  local _LINUX_OS
  _LINUX_OS="$(cat /etc/issue 2> /dev/null)"
  [[ $_LINUX_OS =~ Ubuntu || $_LINUX_OS =~ Debian || $_LINUX_OS =~ Raspbian ]] || return 1
}

is_bash() {
  local _SHELL
  _SHELL="$(ps -p$$ -ocommand=)"
  [[ $_SHELL =~ .*bash$ ]] || return 1
}

is_zsh() {
  local _SHELL
  _SHELL="$(ps -p$$ -ocommand=)"
  [[ $_SHELL =~ .*zsh$ ]] || return 1
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
