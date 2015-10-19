# Ubuntu or Debian only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu || "$(cat /etc/issue 2> /dev/null)" =~ Debian ]] || return 1




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

# PYTHONPATH
export PYTHON_PACKAGES=~/.local/lib/python2.7/site-packages

# Ruby
export RUBYPATH=$HOME/.rbenv/bin

# PATH
export PATH=$HOMEPATH:$RUBYPATH:$TEXLIVE_PATH:$PATH

if [[ -e $HOME/.linuxbrew/bin/brew ]]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

# sudo tab completion
complete -cf sudo

#bash completion for password store
if [[ -e /etc/bash_completion.d/password-store ]]; then
    source /etc/bash_completion.d/password-store
fi
