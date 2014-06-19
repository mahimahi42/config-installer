#!/usr/bin/env sh

installGit () {
    OS=$(uname -a)
    case "$OS" in
        *Ubuntu*)
            installGitMessage $OS
            sudo apt-get -y install git 
            ;;
        *Fedora*)
            installGitMessage $OS
            sudo yum -y install git
            ;;
        *Darwin*)
            installGitMessage $OS
            checkForHomebrew
            brew install git
            ;;
    esac
}

TMUX_INSTALL_DIR=$HOME/.tmux.conf
VIM_INSTALL_DIR=$HOME/.vimrc

installGitMessage () {
    echo "Operating System: $1"
    echo "I might need your sudo password, in order to install git."
}

checkForHomebrew () {
    BREW=$(which brew)
    if [ -z $BREW ]; then
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi
}

setup () {
    clear
    
    echo "Beginning installation"

    GIT_AVAIL=$(which git)
    if [ -z $GIT_AVAIL ]; then
        echo "Checking for git... Not found, will install"
        installGit
    else
        echo "Checking for git... $GIT_AVAIL"
    fi
}

installConfigs() {
    TMUX=.tmux.conf
    VIM=.vimrc
    ZSH=.zshrc
    UNINSTALL=uninstall.sh

    CONFIG_DIR=$(pwd)/tmp
    CONFIG_BAK_DIR=$HOME/config-backup
    TMUX_DIR=$CONFIG_DIR/$TMUX
    VIM_DIR=$CONFIG_DIR/$VIM
    ZSH_DIR=$CONFIG_DIR/$ZSH
    UNINSTALL_DIR=$CONFIG_DIR/$UNINSTALL

    if [ -d $CONFIG_DIR ]; then
        rm -rf $CONFIG_DIR
    fi

    if [ -e $HOME/$TMUX ]; then
        if [ ! -d $CONFIG_BAK_DIR ]; then
            mkdir $CONFIG_BAK_DIR
        fi
        mv $HOME/$TMUX $CONFIG_BAK_DIR
    fi

    if [ -e $HOME/$VIM ]; then
        if [ ! -d $CONFIG_BAK_DIR ]; then
            mkdir $CONFIG_BAK_DIR
        fi
        mv $HOME/$VIM $CONFIG_BAK_DIR
    fi

    if [ -e $HOME/$ZSH ]; then
        if [ ! -d $CONFIG_BAK_DIR ]; then
            mkdir $CONFIG_BAK_DIR
        fi
        mv $HOME/$ZSH $CONFIG_BAK_DIR
    fi

    git clone https://github.com/mahimahi42/config-sync.git tmp

    cp $TMUX_DIR $HOME
    cp $VIM_DIR $HOME
    cp $ZSH_DIR $HOME
    cp $UNINSTALL_DIR $HOME/.uninstall_configs
    chmod u+x $HOME/.uninstall_configs

    rm -rf $CONFIG_DIR
}

displayFinalMessage () {
    echo "\n\n\n"
    echo "All done!"
    echo "Installed configurations for:"
    echo "tmux: $HOME/$TMUX"
    echo "vim: $HOME/$VIM"
    echo "zsh: $HOME/$ZSH"
    echo "To uninstall, just run $HOME/.uninstall_configs"
}

setup
installConfigs
displayFinalMessage
