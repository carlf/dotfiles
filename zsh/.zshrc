source ~/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/z
    zgen oh-my-zsh plugins/pyenv
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/taskwarrior
    zgen oh-my-zsh plugins/systemd
    zgen load willghatch/zsh-cdr
    zgen load zsh-users/zaw
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    zgen load carlf/zsh-plugins rbenv
    zgen load carlf/zsh-plugins emacs
    zgen load lukechilds/zsh-nvm
    zgen save
fi

bindkey '^R' zaw-history
bindkey '^T' zaw-cdr
bindkey '^H' zaw-ssh-hosts

eval `keychain --eval --agents ssh,gpg id_rsa id_rsa_old carlf@photocarl.org`
