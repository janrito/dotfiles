#!/bin/bash

function reload_config() {
  source ~/.dotfiles/bash_profile
}

function _find_powerline_bindings() {
  # grabs location from pip2, which that looks like this:
  # Location: /usr/local/lib/python2.7/site-packages
  # if that is where powerline is installed
  # and turns it into an array – split on the space
  local _bindings_subdir='powerline/bindings'
  local _homebrew_site_packages='/usr/local/lib/python3.6/site-packages/'
  local _debian_site_packages='/usr/local/lib/python2.7/dist-packages/'
  if [[ -d "${_homebrew_site_packages}/${_bindings_subdir}" ]]; then echo "${_homebrew_site_packages}/${_bindings_subdir}"
  elif [[ -d "${_debian_site_packages}/${_bindings_subdir}" ]]; then echo "${_debian_site_packages}/${_bindings_subdir}"
  else
    local _powerline_location=($(pip show powerline-status | grep "^Location: .*$" -o))
    echo ${_powerline_location[1]}'/'$_bindings_subdir
  fi
}


# remove path duplicates
# http://www.commandlinefu.com/commands/view/8606/speed-up-builds-and-scripts-remove-duplicate-entries-in-path.-users-scripts-are-oftern-bad-pathapathpath-type-of-thing-cause-diplicate.

# join arguments
function glu() {
  local IFS="$1"
  shift && echo "$*"
}

# remove duplicates
function repath() {
  _E=`echo "${@//:/$'\n'}" | awk '!x[$0]++'`
  glu ":" $_E
}

# pretty print path
function path() {
  echo "${PATH//:/$'\n'}"
}


## session tests

function is_interactive() {
  # true if session is interactive
  [[ $- == *i* ]] || return 1
}

function is_osx() {
  # return true if running in OSX
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

function is_debian() {
  # return true if session is in Ubuntu, Debian or Raspbian
  _LINUX_OS="$(cat /etc/issue 2> /dev/null)"
  [[ $_LINUX_OS =~ Ubuntu || $_LINUX_OS =~ Debian || $_LINUX_OS =~ Raspbian ]] || return 1
}