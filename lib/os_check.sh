#!/usr/bin/env sh

function mac {
    if [ "$(uname)" == "Darwin" ]; then
        echo 1
    else
        echo 0
    fi
}

function linux {
    if [ "$(uname)" == "Linux" ]; then
        echo 1
    else
        echo 0
    fi
}

mac
linux
