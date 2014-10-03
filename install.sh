#!/usr/bin/env sh

# Some of this is based off of https://gist.github.com/brandonb927/3195465 
# and https://github.com/MatthewMueller/dots/blob/master/os/ubuntu/index.sh

# Exit immediately on encountering an non-zero exit code
set -e

# COLORS!!
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

# Color Reset
alias Reset="tput sgr0"

# Color Echo
cecho () {
    echo "${2}${1}"
    Reset
    return
}

