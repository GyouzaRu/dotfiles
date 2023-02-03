# Set up ZSH home
ZSH=$HOME/.dotfiles/zsh

# Set up the prompt
autoload -U colors && colors
PROMPT="%{$bg[black]%}%{$fg[blue]%}%n%{$reset_color%} %{$fg[green]%}%~%{$reset_color%} %B%#%b "

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# set vi mode
# bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=${ZSH}/.zsh_history
setopt histignorealldups sharehistory

# Use modern completion system
autoload -Uz compinit
compinit

# always display English
export LANG=en_US.UTF-8
export LANGUAGE=en

# repo mirror address
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

# android studio platform-tools and repo
export PATH=$PATH:~/Android/Sdk/platform-tools:~/bin

# segement core
ulimit -c unlimited

# plugin
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Theme
# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

# aliases
if [ -f ${ZSH}/.aliases ]; then
    . ${ZSH}/.aliases
fi

# scripts
if [ -f ${ZSH}/.scripts ]; then
    . ${ZSH}/.scripts
fi
