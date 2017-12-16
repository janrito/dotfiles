#!/bin/bash

function reload_config() {
  source ~/.bash_profile
}

function _find_powerline_bindings() {
  # grabs location from pip2, which that looks like this:
  # Location: /usr/local/lib/python2.7/site-packages
  # if that is where powerline is installed
  # and turns it into an array – split on the space
  local _bindings_subdir='powerline/bindings'
  local _homebrew_site_packages='/usr/local/lib/python2.7/site-packages/'
  local _debian_site_packages='/usr/local/lib/python2.7/dist-packages/'
  if [[ -e "${_homebrew_site_packages}/${_bindings_subdir}" ]]; then echo "${_homebrew_site_packages}/${_bindings_subdir}"
  elif [[ -e "${_debian_site_packages}/${_bindings_subdir}" ]]; then echo "${_debian_site_packages}/${_bindings_subdir}"
  else
    local _powerline_location=($(pip2 show powerline-status | grep "^Location: .*$" -o))
    echo ${_powerline_location[1]}'/'$_bindings_subdir
  fi
}
