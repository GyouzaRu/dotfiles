# common
alias ls='ls --color'
alias ll='ls -alF'
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

# lazygit
alias lg='lazygit'

# vifm
alias vf='vifm'

# clash
alias clash='nohup ~/Software/clash/clash -d . &'
alias unclash='pkill -9 clash && rm ~/Software/clash/nohup.out'