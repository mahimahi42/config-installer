#!/usr/bin/env sh

OS=$(uname -a)

TMUX_INSTALL_DIR=~/.tmux.conf
VIM_INSTALL_DIR=~/.vimrc

TMUX_DIR=$(pwd)/config-sync/.tmux.conf
VIM_DIR=$(pwd)/config-sync/.vimrc

read  -p "Begin installation? [y/n]: " RESP
if [ ! "$RESP" = "y" ]; then
    exit
fi

git clone https://github.com/mahimahi42/config-sync.git

ln -s ${TMUX_DIR} ${TMUX_INSTALL_DIR}
ln -s ${VIM_DIR} ${VIM_INSTALL_DIR}
