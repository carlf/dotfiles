if [ ! -f /usr/local/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

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
brew "ripgrep"
brew "go"
cask "font-jetbrains-mono"
cask "font-fira-code"
cask "font-cascadia-code-pl"
cask "font-ibm-plex-mono"
cask "slack"
cask "signal"
cask "firefox"
cask "kitty"
cask "alfred"
cask "vlc"
cask "mkvtoolnix"
cask "racket"
EOF
