# Ubuntu or Debian only stuff. Abort if not Ubuntu.
_LINUX_OS="$(cat /etc/issue 2> /dev/null)"
[[ $_LINUX_OS =~ Ubuntu || $_LINUX_OS =~ Debian || $_LINUX_OS =~ Raspbian ]] || return 1


# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
    fi
fi

export HOMEPATH=~/.bin:~/.local/bin

# TEXLIVE_PATH
export TEXLIVE_PATH=/usr/local/texlive/2013/bin/x86_64-linux

# Ruby
export RUBYPATH=$HOME/.rbenv/bin

# PATH
export PATH=$HOMEPATH:$RUBYPATH:$TEXLIVE_PATH:$PATH

# GO
export GOPATH=$HOME/.gocode/

if [[ -e $HOME/.pyenv/bin/pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# sudo tab completion
complete -cf sudo

# setup bash completion
if [[ -e /etc/bash_completion ]]; then
    source /etc/bash_completion
fi
