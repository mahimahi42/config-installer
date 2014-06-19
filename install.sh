#!/usr/bin/env sh

OS=$(cat /etc/*-release)
case "$OS" in
    *Ubuntu*)
        echo "DERP"
        ;;
esac
