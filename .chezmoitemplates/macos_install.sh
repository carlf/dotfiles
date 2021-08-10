#!/usr/bin/env bash

brew tap homebrew/cask-fonts
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
brew "svn"
cask "font-jetbrains-mono"
cask "font-fira-code"
cask "font-cascadia-code-pl"
cask "font-ibm-plex-mono"
EOF