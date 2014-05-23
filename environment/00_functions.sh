#!/bin/bash

function check_python() {
    # check if python version is >= 2.7
    return `python -c 'import sys; sys.exit(0 if (sys.version_info >= (2, 7)) else 1)'`
}