source ~/.config/zsh/aliases.zsh


# Setup a custom completions directory
# fpath=(~/.config/zsh/completions $fpath)

# Enable the completion system
# autoload compinit

# Initialize all completions on $fpath and ignore (-i) all insecure files and directories
# compinit -i


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


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

export MANPAGER='svim +Man!'
export GIT_EDITOR=svim
# eval "$(zoxide init --cmd cd zsh)"
