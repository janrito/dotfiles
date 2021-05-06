
# word diff
wd() {
    git wdiff "$@"
    #git diff --no-index --patience --word-diff=plain "$@"
}

# other
alias lss="exa --binary --group --header --links --long --inode --blocks --git"
