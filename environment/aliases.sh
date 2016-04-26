
# aliases
alias t=todo.sh

function wd() {
    git wdiff "$@"
    #git diff --no-index --patience --word-diff=plain "$@"
}

# apm

function apm_update() {
    apm install --packages-file ~/.dotfiles/atom/installed-packages.txt
}

function apm_commit() {
    apm list --installed --bare > ~/.dotfiles/atom/installed-packages.txt
}