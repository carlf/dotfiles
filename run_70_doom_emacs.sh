#!/usr/bin/env bash

# Install emacs
os=$(uname -s)
if [[ $os == "Darwin" ]]; then
    if [[ ! -x /usr/local/bin/emacs ]]; then
        brew tap d12frosted/emacs-plus
        brew install emacs-plus@27
    fi
elif [[ $os == "Linux" ]]; then
    distro=$(lsb_release -is)
    if [[ $distro == "Ubuntu" ]]; then
        if [[ ! -x /usr/bin/emacs ]]; then
            sudo apt install -y emacs
        fi
    fi
fi

# Install doom
if [[ ! -f ~/.emacs.d/bin/doom ]]; then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install --no-config --no-fonts --no-env
    ~/.emacs.d/bin/doom env
fi

os=$(uname -s)
if [[ $os == "Darwin" ]]; then
    daemon_status=$(brew services list | grep emacs | awk '{print $2}')
    if [[ ! $daemon_status == "started" ]]; then
        brew services start emacs-plus@27
    fi
elif [[ $os == "Linux" ]]; then
    distro=$(lsb_release -is)
    if [[ $distro == "Ubuntu" ]]; then
        systemctl --quiet --user is-enabled emacs.service
        if [[ $? -ne 0 ]]; then
            systemctl --user enable emacs.service
        fi

        systemctl --quiet --user is-active emacs.service
        if [[ $? -ne 0 ]]; then
            systemctl --user start emacs.service
        fi
    fi
fi
