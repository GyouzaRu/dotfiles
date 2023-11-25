# common
alias ls='ls --color'
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# tmux
alias tmd='tmux detach'
alias tml='tmux ls'
alias tma='tmux attach -t'
alias tms='tmux switch -t'

# git
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gba='git branch -a'
alias gd='git diff'
alias gs='git switch'
alias gl='git log'
alias glog='git log --oneline --graph'

# docker
alias dim='docker image'
alias dco='docker container'
alias dex='docker exec'
alias dru='docker run'

# nvim
if [ -n "$VIMRUNTIME" ]; then
    if [ -n "$TMUX_PROGRAM" ]; then
        alias vim='nvim --server /tmp/nvim-server-$(tmux display-message -p "#{session_name}")-$(tmux display-message -p "#{window_index}")-$(tmux display-message -p "#{pane_index}").pipe --remote-tab'
    else
        alias vim='nvim --server /tmp/nvim-server.pipe --remote-tab'
    fi
else
    if [ -n "$TMUX_PROGRAM" ]; then
        alias vim='nvim --listen /tmp/nvim-server-$(tmux display-message -p "#{session_name}")-$(tmux display-message -p "#{window_index}")-$(tmux display-message -p "#{pane_index}").pipe'
    else
        alias vim='nvim --listen /tmp/nvim-server.pipe'
    fi
fi

# lazygit
alias lg='lazygit'

# lazydocker
alias lzd='lazydocker'

# vifm
alias vf='vifm'

# joshuto
alias jo='joshuto'

# clash
alias clash='nohup ~/Software/clash/clash-linux-amd64-v3-v1.18.0/clash-linux-amd64-v3 -f ~/Software/clash/MyConfig.yaml > /tmp/clash.log &'
alias unclash='pkill -9 clash && rm /tmp/clash.log'
