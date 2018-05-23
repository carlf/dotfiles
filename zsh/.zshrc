POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv pyenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

export DISABLE_AUTO_TITLE=true

source ~/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/z
    zgen oh-my-zsh plugins/pyenv
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/tmuxinator
    zgen oh-my-zsh plugins/nvm
    zgen load carlf/zsh-plugins rbenv
    zgen load carlf/zsh-plugins emacs
    zgen load bhilburn/powerlevel9k powerlevel9k next
    zgen load andrewferrier/fzf-z
    zgen save
fi

export PATH=~/bin:~/go/bin:$PATH

alias mux=tmuxinator

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^N' fzfz-file-widget
