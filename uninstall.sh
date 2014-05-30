#!/usr/bin/env sh

TMUX_DIR=~/.tmux.conf
VIM_DIR=~/.vimrc

skip () {
    echo "No $1 found, skipping"
}

read -p "Uninstall configuration? [y/n]: " RESP
if [ ! "$RESP" = "y" ]; then
    exit
fi

if [ -e $TMUX_DIR ]; then
    rm $TMUX_DIR
fi

if [ -e $VIM_DIR ]; then
    rm $VIM_DIR
else
    skip ".vimrc"
fi


