#!/usr/bin/env sh

OS=$(uname -a)

TMUX_INSTALL_DIR=~/.tmux.conf
VIM_INSTALL_DIR=~/.vimrc

CONFIG_DIR=$(pwd)/config-sync
TMUX_DIR=$CONFIG_DIR/.tmux.conf
VIM_DIR=$CONFIG_DIR/.vimrc

read  -p "Begin installation? [y/n]: " RESP
if [ ! "$RESP" = "y" ]; then
    exit
fi

if [ -d $CONFIG_DIR ]; then
	rm -rf $CONFIG_DIR
fi

git clone https://github.com/mahimahi42/config-sync.git

ln -s ${TMUX_DIR} ${TMUX_INSTALL_DIR}
ln -s ${VIM_DIR} ${VIM_INSTALL_DIR}
