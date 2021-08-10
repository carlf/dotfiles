#!/usr/bin/env bash

sudo gpg --no-default-keyring --keyring \
     /usr/share/keyrings/weechat-archive-keyring.gpg \
     --keyserver hkps://keys.openpgp.org \
     --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
deb="deb [signed-by=/usr/share/keyrings/weechat-archive-keyring.gpg]"
debsrc="deb-src [signed-by=/usr/share/keyrings/weechat-archive-keyring.gpg]"
repo="https://weechat.org/ubuntu $(lsb_release -cs) main"
echo "$deb $repo" | sudo tee /etc/apt/sources.list.d/weechat.list
echo "$debsrc $repo" | sudo tee -a /etc/apt/sources.list.d/weechat.list
sudo apt update
sudo apt install -y \
     git \
     gpg \
     golang \
     kitty \
     ripgrep \
     pinentry-gnome3 \
     weechat-curses \
     aria2 \
     jq \
     nnn \
     atool \
     tmux \
     tmuxp \
     pwgen \
     yubikey-manager \
     zsh \
     fonts-jetbrains-mono \
     fonts-firacode \
     fonts-cascadia-code \
     fonts-ibm-plex
