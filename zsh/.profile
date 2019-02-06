#!/usr/bin/env bash

export PATH=~/bin:~/go/bin:$PATH
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
