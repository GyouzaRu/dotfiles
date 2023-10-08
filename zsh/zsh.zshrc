# Set up ZSH home
DOTFILES=${HOME}/.config/dotfiles
ZSH=${DOTFILES}/zsh
BASH=${DOTFILES}/bash

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
# bindkey -e

# set vi mode
bindkey -v

# choose vim as default editor
# export EDITOR=nvim
if [ -n "$VIMRUNTIME" ]; then
    if [ -n "$TMUX_PROGRAM" ]; then
        export EDITOR='nvim --server /tmp/nvim-server-$(tmux display-message -p "#{session_name}")-$(tmux display-message -p "#{window_index}")-$(tmux display-message -p "#{pane_index}").pipe --remote'
    else
        export EDITOR='nvim --server /tmp/nvim-server.pipe --remote'
    fi
else
    export EDITOR=nvim
    # if [ -n "$TMUX_PROGRAM" ]; then
    #     export EDITOR='nvim --listen /tmp/nvim-server-$(tmux display-message -p "#{session_name}")-$(tmux display-message -p "#{window_index}")-$(tmux display-message -p "#{pane_index}").pipe'
    # else
    #     export EDITOR='nvim --listen /tmp/nvim-server.pipe'
    # fi
fi

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
export PATH=~/Android/Sdk/platform-tools:~/.local/bin:$PATH

# segement core
ulimit -c unlimited

# plugin
if [ -f /usr/share/zsh-antigen/antigen.zsh ]; then
source /usr/share/zsh-antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jeffreytse/zsh-vi-mode

antigen apply

# Always starting with insert mode for each command line
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
fi

# Theme
# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

# X11 forwarding
if [ -v SSH_CLIENT ]; then
    client_ip=$(echo $SSH_CLIENT | awk '{print $1}')
    export DISPLAY=$client_ip:0.0
fi

# aliases
if [ -f ${BASH}/aliases.bash ]; then
    . ${BASH}/aliases.bash
fi

# scripts
if [ -f ${BASH}/scripts.bash ]; then
    . ${BASH}/scripts.bash
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

