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
export PATH=$PATH:~/Android/Sdk/platform-tools:~/Software/bin:~/.local/bin/

# segement core
ulimit -c unlimited

# plugin
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Theme
# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

# aliases
if [ -f ${ZSH}/aliases.bash ]; then
    . ${ZSH}/aliases.bash
fi

# scripts
if [ -f ${ZSH}/scripts.bash ]; then
    . ${ZSH}/scripts.bash
fi

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

