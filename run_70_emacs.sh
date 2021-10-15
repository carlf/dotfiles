#!/usr/bin/env bash

# Install emacs
os=$(uname -s)
if [[ $os == "Darwin" ]]; then
    if [[ ! -x /usr/local/bin/emacs ]]; then
        brew tap d12frosted/emacs-plus
        brew install emacs-plus@28
    fi
elif [[ $os == "Linux" ]]; then
    distro=$(lsb_release -is)
    if [[ $distro == "Ubuntu" ]]; then
        if [[ ! -x /usr/bin/emacs ]]; then
            sudo apt install -y emacs
        fi
    fi
fi
