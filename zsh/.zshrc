# Set up ZSH home
DOTFILES=${HOME}/.dotfiles
ZSH=${HOME}/.dotfiles/zsh

# Set up the prompt
autoload -U colors && colors
# PROMPT="%{$bg[black]%}%{$fg[blue]%}%n%{$reset_color%} %{$fg[green]%}%~%{$reset_color%} %B%#%b "

# git branch info in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt prompt_subst
PROMPT='%F{green}%~%{%F{blue}%}$(parse_git_branch)%{%F{none}%} %B%#%b '

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# set vi mode
# bindkey -v

# choose vim as default editor
export EDITOR=vim

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=${ZSH}/.zsh_history
setopt histignorealldups sharehistory

# Use modern completion system
autoload -Uz compinit
compinit

# always display English
# export LANG=en_US.UTF-8
# export LANGUAGE=en

# repo mirror address
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

# android studio platform-tools and repo
export PATH=~/Android/Sdk/platform-tools:$PATH

# segement core
ulimit -c unlimited

# plugin
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Theme
# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

# X11 forwarding
if [ -v SSH_CLIENT ]; then
    client_ip=$(echo $SSH_CLIENT | awk '{print $1}')
    export DISPLAY=$client_ip:0.0
fi

# aliases
if [ -f ${ZSH}/aliases.bash ]; then
    . ${ZSH}/aliases.bash
fi

# scripts
if [ -f ${ZSH}/scripts.bash ]; then
    . ${ZSH}/scripts.bash
fi

# tmux
# if [[ $TERM_PROGRAM != "tmux" ]]; then
#     if [ $(pgrep -c tmux) != "0" ]; then
#         tmux a
#     elif [ -n $(which tmux) ]; then
#         tmux new -t daily
#     fi
# fi

# fzf
if [ -f ${DOTFILES}/fzf/shell/completion.zsh ]; then
    source ${DOTFILES}/fzf/shell/completion.zsh
fi
if [ -f ${DOTFILES}/fzf/shell/key-bindings.zsh ]; then
    source ${DOTFILES}/fzf/shell/key-bindings.zsh
fi
if [ -f ${DOTFILES}/fzf/setting.bash ]; then
    source ${DOTFILES}/fzf/setting.bash
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jasper/software/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jasper/software/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jasper/software/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jasper/software/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

