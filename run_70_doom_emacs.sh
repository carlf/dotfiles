#!/usr/bin/env bash

os=$(uname -s)
if [[ $os == "Darwin" ]]; then
    if [[ ! -x /usr/local/bin/emacs ]]; then
        brew tap d12frosted/emacs-plus
        brew install emacs-plus@27
    fi

    daemon_status=$(brew services list | grep emacs | awk '{print $2}')
    if [[ ! $daemon_status == "started" ]]; then
        brew services start emacs-plus@28
    fi
elif [[ $os == "Linux" ]]; then
    distro=$(lsb_release -is)
    if [[ $distro == "Ubuntu" ]]; then
       if [[ ! -x /snap/bin/emacs ]]; then
           sudo snap install emacs --edge --classic
       fi

       if [[ ! -f ~/.config/systemd/user/emacs.service ]]; then
           mkdir -p ~/.config/systemd/user
           cp /snap/emacs/current/usr/lib/systemd/user/emacs.service ~/.config/systemd/user/
       fi

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

if [[ ! -f ~/.emacs.d/bin/doom ]]; then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install --no-config --no-fonts --no-env
    ~/.emacs.d/bin/doom env
fi
