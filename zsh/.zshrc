source /usr/share/zsh/scripts/zplug/init.zsh

bindkey -v

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

zplug "plugins/git",                       from:oh-my-zsh
zplug "plugins/golang",                    from:oh-my-zsh
zplug "plugins/systemd",                   from:oh-my-zsh
zplug "plugins/rbenv",                     from:oh-my-zsh
zplug "plugins/pyenv",                     from:oh-my-zsh
zplug "plugins/fzf",                       from:oh-my-zsh
zplug "plugins/fasd",                      from:oh-my-zsh
zplug "plugins/nvm",                       from:oh-my-zsh
zplug "plugins/tmux-cssh",                 from:oh-my-zsh
zplug "carlf/zsh-plugins",                 use:"emacs/*.zsh"
zplug "carlf/zsh-plugins",                 use:"edit-command-line/*.zsh"
zplug "carlf/zsh-plugins",                 use:"aliases/*.zsh"
zplug "ahmetb/kubectl-aliases",            use:".kubectl_aliases"
zplug "mafredri/zsh-async",                from:github
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
eval "$(starship init zsh)"
