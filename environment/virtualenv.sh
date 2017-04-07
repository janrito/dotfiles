# only run if interactive
[[ $- == *i* ]] || return 1

# virtualenvwrapper
if [[ "$(type -P virtualenvwrapper.sh)" ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    . virtualenvwrapper_lazy.sh
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
fi