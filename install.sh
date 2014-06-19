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

main () {
    displayWelcomeMessage
    
    checkForGit
}

main
