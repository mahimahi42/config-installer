#!/usr/bin/env sh

function ubuntu {
    if hash lsb_release 2>/dev/null; then
        if test "${Ubuntu#*`lsb_release -i`}" = "Ubuntu"; then
            echo 0
        else
            echo 1
        fi
    else
        echo 0
    fi
}

function red_hat {
    if [ -f /etc/redhat-release ]; then
        echo 1
    else
        echo 0
    fi
}

ubuntu
red_hat
