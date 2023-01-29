# Set up ZSH home
export ZSH=$HOME/.config/zsh

# Set up the prompt
autoload -U colors && colors
PROMPT="%{$bg[black]%}%{$fg[blue]%}%n%{$reset_color%} %{$fg[green]%}%~%{$reset_color%} %B%#%b "

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# set vi mode
# bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$ZSH/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# plugin
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Theme
# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

######################################
# aliases
######################################
# common
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ra='ranger'

# tmux
alias tmd='tmux detach'
alias tml='tmux ls'
alias tma='tmux attach -t'
alias tms='tmux switch -t'

# git
alias ga='git add'
alias gc='git commit'
alias gl='git log'
alias gs='git status'
alias lg='lazygit'

######################################
# proxy setting
######################################
proxy(){
    export ALL_PROXY="sock5://127.0.0.1:7890"
    export all_proxy="sock5://127.0.0.1:7890"
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    echo "start proxy"
}

wslproxy(){
    wsl_hostip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
    export ALL_PROXY="sock5://$wsl_hostip:7890"
    export all_proxy="sock5://$wsl_hostip:7890"
    export http_proxy="http://$wsl_hostip:7890"
    export https_proxy="http://$wsl_hostip:7890"
    echo "start wsl proxy, $wsl_hostip"
}

unproxy(){
    unset ALL_PROXY
    unset all_proxy
    unset http_proxy
    unset https_proxy
    echo "unset all proxy"
}


# repo mirror address
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

# android studio platform-tools
export PATH=$PATH:~/Android/Sdk/platform-tools

# segement core
ulimit -c unlimited

# change cursor in zsh
#_fix_cursor() {
#       echo -ne '\e[5 q'
#   }
#
#precmd_functions+=(_fix_cursor)
