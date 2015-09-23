
# aliases
alias t=todo.sh

function wd() {
    git wdiff "$@"
    #git diff --no-index --patience --word-diff=plain "$@"
}