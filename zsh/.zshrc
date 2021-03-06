source ~/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/gh
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/rbenv
    zgen oh-my-zsh plugins/pyenv
    zgen oh-my-zsh plugins/fzf
    zgen oh-my-zsh plugins/fasd
    zgen oh-my-zsh plugins/gcloud
    zgen load carlf/zsh-plugins emacs
    zgen load carlf/zsh-plugins edit-command-line
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load dracula/zsh
    zgen save
fi

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
eval $(starship init zsh)
