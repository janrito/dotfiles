
wd() {
    git wdiff "$@"
    #git diff --no-index --patience --word-diff=plain "$@"
}

## apm
apm_install_all() {
    apm install --packages-file ~/.dotfiles/atom/installed-packages.txt
}

apm_diff() {
    apm list --installed --bare | grep '^[^@]\+' -o | sort -f | diff - ~/.dotfiles/atom/installed-packages.txt
}

apm_commit() {
    apm list --installed --bare | grep '^[^@]\+' -o  | sort -f > ~/.dotfiles/atom/installed-packages.txt
}

## other
alias lss="exa --binary --group --header --links --long --inode --blocks --git"
