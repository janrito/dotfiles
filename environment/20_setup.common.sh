# Set Editor Editor to neovim if available, vim otherwise
if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi

# Default Pager
export PAGER="/usr/bin/less -isM"

#rbenv
if command -v rbenv &> /dev/null; then
     eval "$(rbenv init -)"
fi

# pyenv
if [[ -f $HOME/.pyenv/bin/pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Perl local modules
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"


# Set colors in Command line to true
CLICOLOR=True
export CLICOLOR

# generated using https://geoff.greer.fm/lscolors/
# go look at it
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="${LS_COLORS}:di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# pass & gopass should output ascii armoured instead of binary files
export PASSWORD_STORE_GPG_OPTS="--armor"
export GOPASS_GPG_OPTS=$PASSWORD_STORE_GPG_OPTS

# gpg
export GPG_TTY=$(tty)