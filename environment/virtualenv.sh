is_interactive || return 1

# virtualenvwrapper

if command -v virtualenvwrapper.sh &> /dev/null; then
    export WORKON_HOME=$HOME/.virtualenvs
    . virtualenvwrapper_lazy.sh
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
fi