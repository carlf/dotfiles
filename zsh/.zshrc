source ~/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/z
    zgen oh-my-zsh plugins/pyenv
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/systemd
    zgen load willghatch/zsh-cdr
    zgen load zsh-users/zaw
    zgen load carlf/zsh-plugins rbenv
    zgen load carlf/zsh-plugins emacs
    zgen load lukechilds/zsh-nvm
    zgen load bhilburn/powerlevel9k powerlevel9k
    zgen save
fi

bindkey '^R' zaw-history
bindkey '^T' zaw-cdr
bindkey '^H' zaw-ssh-hosts

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv pyenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs history status)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

export PATH=~/bin:~/go/bin:$PATH

eval `keychain --eval --agents ssh,gpg id_rsa id_rsa_old carlf@photocarl.org`
