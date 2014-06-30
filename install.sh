#!/usr/bin/env sh

displayWelcomeMessage () {
    clear

    echo "Welcome to my development environment setup script!"
    echo "I'm going to need git, since the configuration files are hosted on GitHub."
}

checkForGit () {
    GIT_AVAIL=$(which git)
    if [ -z $GIT_AVAIL ]; then
        echo "Checking for git... Not found, will install"
        installGit
    else
        echo "Checking for git... $GIT_AVAIL"
    fi
}

installGit () {
    OS=$(cat /etc/*-release)
    case "$OS" in
        *Ubuntu*)
            echo "I'm going to install git via apt. I may need your sudo password."
            sudo apt-get -y install git
            ;;
    esac
}

backupFile () {
    if [ -e $HOME/$1 ]; then
        if [ ! -d $2 ]; then
            mkdir $2
        fi
        mv $HOME/$1 $BAK_DIR
    fi
}

backupConfigs () {
    BAK_DIR=$HOME/.config-backups/

    backupFile .tmux.conf $BAK_DIR
    backupFile .vimrc $BAK_DIR
    backupFile .zshrc $BAK_DIR

#    if [ -e $HOME/.tmux.conf ]; then
#        if [ ! -d $BAK_DIR ]; then
#            mkdir $BAK_DIR
#        fi
#        mv $HOME/.tmux.conf $BAK_DIR
#    fi

#    if [ -e $HOME/.vimrc ]; then
#        if [ ! -d $BAK_DIR ]; then
#            mkdir $BAK_DIR
#        fi
#        mv $HOME/.vimrc $BAK_DIR
#    fi

#    if [ -e $HOME/.zshrc ]; then
#        if [ ! -d $BAK_DIR ]; then
#            mkdir $BAK_DIR
#        fi
#        mv $HOME/.zshrc $BAK_DIR
#    fi
}

installNewConfigs () {
    git clone https://github.com/mahimahi42/config-sync.git tmp

    cp tmp/.tmux.conf $HOME
    cp tmp/.vimrc $HOME
    cp tmp/.zshrc $HOME
    cp tmp/uninstall.sh $HOME/.uninstall_configs
    chmod +x $HOME/.uninstall_configs

    rm -rf tmp/
}

displayFinalMessage () {
    echo "\n\n\n"
    echo "All done!"
    echo "Installed configurations for:"
    echo "tmux: $HOME/.tmux.conf"
    echo "vim: $HOME/.vimrc"
    echo "zsh: $HOME/.zshrc"
    echo "To uninstall, run $HOME/.uninstall_configs"
}

main () {
    displayWelcomeMessage
    
    checkForGit

    backupConfigs

    installNewConfigs

    displayFinalMessage
}

main
