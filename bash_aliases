alias pipu="pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 'LATEST:'"
