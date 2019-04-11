export DISABLE_AUTO_TITLE=true
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export SPACESHIP_CHAR_SYMBOL='$ '
export SPACESHIP_PYENV_SHOW=false
export SPACESHIP_RUBY_SHOW=false
export SPACESHIP_EXIT_CODE_SHOW=true

export ZSH_TMUX_AUTOSTART=true

source /usr/share/zsh/share/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/z
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/rbenv
    zgen oh-my-zsh plugins/pyenv
    zgen oh-my-zsh plugins/tmux
    zgen load carlf/zsh-plugins emacs
    zgen load denysdovhan/spaceship-prompt spaceship
    zgen save
fi

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
