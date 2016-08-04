#!/bin/bash

function reload_config() {
  source ~/.bash_profile
}

function _find_powerline_bindings() {
  # grabs location from pip, which that looks like this:
  # Location: /usr/local/lib/python2.7/site-packages
  # if that is where powerline is installed
  # and turns it into an array – split on the space
  local _powerline_location=($(pip show powerline-status | grep "^Location: .*$" -o))
  local _bindings_subdir='powerline/bindings'
  echo ${_powerline_location[1]}'/'$_bindings_subdir
}
