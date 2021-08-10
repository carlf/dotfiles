#!/usr/bin/env bash

brew bundle --no-lock --file=/dev/stdin <<EOF
brew "gnupg"
brew "pinentry"
brew "pinentry-mac"
brew "pwgen"
brew "tmux"
brew "tmuxp"
brew "nnn"
brew "jq"
brew "weechat"
brew "aria2"
brew "atool"
brew "ykman"
EOF
