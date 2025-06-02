source ~/.config/zsh/aliases.zsh
export STARSHIP_CONFIG=~/.config/starship.toml


# Setup a custom completions directory
fpath=(~/.config/zsh/completions $fpath)

# Enable the completion system
autoload compinit

# Initialize all completions on $fpath and ignore (-i) all insecure files and directories
compinit -i


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -i | gum filter --reverse --limit 1 --placeholder 'Pick a sesh' --height 50 --prompt='⚡')
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle -N sesh-sessions
bindkey -M emacs '^f' sesh-sessions
bindkey -M vicmd '^f' sesh-sessions
bindkey -M viins '^f' sesh-sessions


source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
