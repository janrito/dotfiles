# Set Editor Editor to vim
export EDITOR='vim'

# Default Pager
export PAGER="/usr/bin/less -isM"

#rbenv
if [[ "$(type -P rbenv)" ]]; then
     eval "$(rbenv init -)"
fi

# Perl local modules
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"


# Set colors in Command line to true
CLICOLOR=True
export CLICOLOR

# pass should output ascii armoured instead of binary files
export PASSWORD_STORE_GPG_OPTS="--armor"
