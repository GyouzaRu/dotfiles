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
alias vim='nvim'

# lazygit
alias lg='lazygit'

# lazydocker
alias lzd='lazydocker'

# vifm
alias vf='vifm'

# joshuto
alias jo='joshuto'

# clash
alias clash='nohup ~/Software/clash/clash -d ~/Software/clash/ > ~/Software/clash/nohup.out &'
alias unclash='pkill -9 clash && rm ~/Software/clash/nohup.out'
