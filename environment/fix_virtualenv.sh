# based on this
# https://gist.github.com/tevino/1a557a0c200d61d4e4fb

fix_virtualenv() {
    local VIRTUALENV VIRTUALENV_ROOT PYTHON args
    args=()
    PYTHON="python"
    VIRTUALENV=$(which virtualenv)

    usage() {
        if [ ! -z $ ]; then
            echo "${1}"
        fi
        echo "fix_virtualenv [-p ptyhon] PATH_TO_VIRTUALENV"
    }

    while [[ $1 ]]
    do
        case $1 in
        -p | --python)
            if [ -z $2 ]; then
                usage
                return 0
            else
                PYTHON=$2
                shift 2
            fi
            ;;
        *)
            args+=("$1")
            shift
            ;;
        --)
            usage
            return 0
        esac
    done

    if [ -z $args ]; then
        usage
        return 0
    fi

    VIRTUALENV_ROOT=${args[0]}
    PYTHON=$(which $PYTHON)

    if [ ! -x "${PYTHON}" ]; then
        usage "${PYTHON} not valid python"
        return 0
    fi;

    if [ ! -d "${VIRTUALENV_ROOT}/bin" ]; then
        usage "${VIRTUALENV_ROOT}/bin not a directory"
        return 0
    fi
    if [ ! -L "${VIRTUALENV_ROOT}/.Python" ]; then
        usage "${VIRTUALENV_ROOT}/.Python symlink not found!"
        return 0
    fi

    if [ ! -e "${VIRTUALENV_ROOT}/bin/python" ]; then
        usage "${VIRTUALENV_ROOT}/bin/python not found!"
        return 0
    fi
    if [ ! -e "${VIRTUALENV_ROOT}/bin/pip" ]; then
        usage "${VIRTUALENV_ROOT}/bin/pip not found!"
        return 0
    fi
    if [ ! -e "${VIRTUALENV_ROOT}/bin/activate" ]; then
        usage "${VIRTUALENV_ROOT}/bin/activate not found!"
        return 0
    fi

    echo "♻️  Removing old symbolic links......"
    find "$VIRTUALENV_ROOT" -type l -delete -print

    echo "💫  Creating new symbolic links......"
    $VIRTUALENV -p "$PYTHON" "$VIRTUALENV_ROOT"

    echo "🎉  Done!"
}