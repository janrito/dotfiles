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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export EDITOR=vim

# TEXLIVE_PATH
export TEXLIVE_PATH=/usr/local/texlive/2012/bin/x86_64-linux

# PYTHONPATH
export PYTHONPATH=/usr/local/lib/python2.7/dist-packages

# CUDA
export CUDAPATH=/opt/bin
export LD_LIBRARY_PATH=/opt/lib:/opt/lib64:/usr/local/lib:$LD_LIBRARY_PATH

# PATH
export PATH=$CUDAPATH:$TEXLIVE_PATH:$PATH

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# tmux powerline
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh


# sudo tab completion
complete -cf sudo
