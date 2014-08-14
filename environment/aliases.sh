
# aliases
alias t=todo.sh
alias comatlab='matlab -nodisplay -nojvm'
alias pipu="pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 'LATEST:'"

function wd() {
    git wdiff "$@"
    #git diff --no-index --patience --word-diff=plain "$@"
}