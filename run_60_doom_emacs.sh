#!/usr/bin/env bash

if [[ ! -f ~/.emacs.d/bin/doom ]]; then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install --no-config --no-fonts --no-env
    ~/.emacs.d/bin/doom env
fi
