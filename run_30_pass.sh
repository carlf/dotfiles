#!/usr/bin/env bash

if [[ ! -d ~/.password-store ]]; then
    git clone git@gitea.carlf.io:hephaestus/pass.git ~/.password-store
fi
