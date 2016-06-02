
# aliases
alias t=todo.sh

function wd() {
    git wdiff "$@"
    #git diff --no-index --patience --word-diff=plain "$@"
}

# apm

function apm_install_all() {
    apm install --packages-file ~/.dotfiles/atom/installed-packages.txt
}

function apm_diff() {\
    apm list --installed --bare | grep '^[^@]\+' -o | diff - ~/.dotfiles/atom/installed-packages.txt
}

function apm_commit() {
    apm list --installed --bare | grep '^[^@]\+' -o > ~/.dotfiles/atom/installed-packages.txt
}


function spf13_update() {
    cd $HOME/.spf13-vim-3/
    git pull
    vim +BundleInstall! +BundleClean +qa
    cd -
}
