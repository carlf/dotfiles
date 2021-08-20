#!/usr/bin/env bash

sudo mkdir /root/.gnupg
sudo gpg --no-default-keyring --keyring \
     /usr/share/keyrings/weechat-archive-keyring.gpg \
     --keyserver hkps://keys.openpgp.org \
     --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
deb="deb [arch=amd64 signed-by=/usr/share/keyrings/weechat-archive-keyring.gpg]"
debsrc="deb-src [signed-by=/usr/share/keyrings/weechat-archive-keyring.gpg]"
repo="https://weechat.org/ubuntu $(lsb_release -cs) main"
echo "$deb $repo" | sudo tee /etc/apt/sources.list.d/weechat.list
echo "$debsrc $repo" | sudo tee -a /etc/apt/sources.list.d/weechat.list
sudo add-apt-repository -y ppa:regolith-linux/release
sudo apt update
sudo apt install -y \
     aria2 \
     atool \
     cmake \
     fd-find \
     fonts-cascadia-code \
     fonts-firacode \
     fonts-ibm-plex \
     fonts-jetbrains-mono \
     fzf \
     git \
     golang-go \
     gpg \
     graphviz \
     jq \
     kitty \
     make \
     nnn \
     pandoc \
     pinentry-gnome3 \
     pwgen \
     regolith-desktop-standard \
     regolith-look-nord \
     ripgrep \
     shellcheck \
     tmux \
     tmuxp \
     weechat-curses \
     yubikey-manager \
     zsh
sudo snap install slack --classic
sudo snap install signal-desktop
regolith-look set nord
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
