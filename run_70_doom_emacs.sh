#!/usr/bin/env bash

os=$(uname -s)
if [[ $os == "Darwin" ]]; then
    if [[ ! -x /usr/local/bin/emacs ]]; then
        brew tap d12frosted/emacs-plus
        brew install emacs-plus@28 --with-native-comp
    fi
elif [[ $os == "Linux" ]]; then
    distro=$(lsb_release -is)
    if [[ $distro == "Ubuntu" ]];
       if [[ ! -x /snap/bin/emacs ]]; then
           sudo snap install emacs --edge --classic
       fi
    fi
fi

if [[ ! -f ~/.emacs.d/bin/doom ]]; then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install --no-config --no-fonts --no-env
    ~/.emacs.d/bin/doom env
fi
