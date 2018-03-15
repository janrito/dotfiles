#!/bin/bash

reload_config() {
  source ~/.dotfiles/bash_profile
}

# remove path duplicates
# http://www.commandlinefu.com/commands/view/8606/speed-up-builds-and-scripts-remove-duplicate-entries-in-path.-users-scripts-are-oftern-bad-pathapathpath-type-of-thing-cause-diplicate.

# join arguments
glu() {
  local IFS="$1"
  shift && echo "$*"
}

# remove duplicates
repath() {
  _E=`echo "${@//:/$'\n'}" | awk '!x[$0]++'`
  glu ":" $_E
}

# pretty print path
path() {
  echo "${PATH//:/$'\n'}"
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

is_debian() {
  # return true if session is in Ubuntu, Debian or Raspbian
  _LINUX_OS="$(cat /etc/issue 2> /dev/null)"
  [[ $_LINUX_OS =~ Ubuntu || $_LINUX_OS =~ Debian || $_LINUX_OS =~ Raspbian ]] || return 1
}

## based on https://github.com/kennethreitz/dotfiles/blob/master/.aliases
battery() {
  pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'
  pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f3 -d';'
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