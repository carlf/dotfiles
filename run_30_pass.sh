#!/usr/bin/env bash

if [[ ! -f ~/go/bin/gopass ]]; then
    go install github.com/gopasspw/gopass@latest
fi

if [[ ! -d ~/.password-store ]]; then
    git clone git@gitea.carlf.io:hephaestus/pass.git ~/.password-store
fi
