# Set Editor Editor to neovim if available, vim otherwise
if [[ "$(type -P nvim)" ]]; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi

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

# pass & gopass should output ascii armoured instead of binary files
export PASSWORD_STORE_GPG_OPTS="--armor"
export GOPASS_GPG_OPTS=$PASSWORD_STORE_GPG_OPTS

# gpg
export GPG_TTY=$(tty)