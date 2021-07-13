#!/usr/bin/env bash

export PATH=~/.krew/bin:~/bin:~/go/bin:$PATH
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
source "$HOME/.cargo/env"
