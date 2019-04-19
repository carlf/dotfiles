export DISABLE_AUTO_TITLE=true
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export SPACESHIP_CHAR_SYMBOL='$ '
export SPACESHIP_PYENV_SHOW=false
export SPACESHIP_RUBY_SHOW=false
export SPACESHIP_EXIT_CODE_SHOW=true

source /usr/share/zsh/scripts/zplug/init.zsh

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

zplug "plugins/git",        from:oh-my-zsh
zplug "plugins/golang",     from:oh-my-zsh
zplug "plugins/systemd",    from:oh-my-zsh
zplug "plugins/rbenv",      from:oh-my-zsh
zplug "plugins/pyenv",      from:oh-my-zsh
zplug "plugins/kubectl",    from:oh-my-zsh
zplug "plugins/fzf",        from:oh-my-zsh
zplug "plugins/fasd",       from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "plugins/tmux-cssh",  from:oh-my-zsh
zplug "carlf/zsh-plugins", use:"emacs/*.zsh"
zplug "carlf/zsh-plugins", use:"dircolors/*.zsh"
zplug "denysdovhan/spaceship-prompt", as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
