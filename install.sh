#!/usr/bin/env sh

OS=$(uname -a)

TMUX_INSTALL_DIR=~/.tmux.conf
VIM_INSTALL_DIR=~/.vimrc

TMUX_DIR=$(pwd)/.tmux.conf
VIM_DIR=$(pwd)/.vimrc

ln -s ${TMUX_DIR} ${TMUX_INSTALL_DIR}
ln -s ${VIM_DIR} ${VIM_INSTALL_DIR}
