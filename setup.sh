# create backup folder
CONFIG="${HOME}/.config"
DOTFILES="${HOME}/.dotfiles"
BACKUP="${CONFIG}/.backup_origin"

if [ ! -d "${BACKUP}" ];then
    mkdir ${BACKUP}
    echo "create backup folder ${BACKUP}"
fi

# move the original file to the backup folder
mv ${HOME}/.zshrc ${BACKUP}
mv ${HOME}/.bashrc ${BACKUP}

mv ${HOME}/.tmux ${BACKUP}
mv ${HOME}/.tmux.conf ${BACKUP}
mv ${HOME}/.tmux.conf.local ${BACKUP}

mv ${HOME}/.vimrc ${BACKUP}
mv ${CONFIG}/nvim ${BACKUP}
mv ${CONFIG}/alacritty ${BACKUP}
mv ${CONFIG}/vifm ${BACKUP}
mv ${CONFIG}/lazygit ${BACKUP}

mv ${HOME}/.gitconfig ${BACKUP}

echo "move original files to ${BACKUP}"

# set the symlink
ln -sf ${DOTFILES}/zsh/zsh.zshrc ${HOME}/.zshrc
ln -sf ${DOTFILES}/bash/bash.bashrc ${HOME}/.bashrc

ln -sf ${DOTFILES}/tmux/tmux ${HOME}/.tmux
ln -sf ${DOTFILES}/tmux/tmux.conf ${HOME}/.tmux.conf
# ln -sf ${DOTFILES}/tmux/oh-my-tmux/.tmux.conf.local ${HOME}/.tmux.conf.local

ln -sf ${DOTFILES}/vim/vim.vimrc ${HOME}/.vimrc
ln -sf ${DOTFILES}/nvim ${CONFIG}/nvim
ln -sf ${DOTFILES}/alacritty ${CONFIG}/alacritty
ln -sf ${DOTFILES}/vifm ${CONFIG}/vifm
ln -sf ${DOTFILES}/lazygit ${CONFIG}/lazygit
ln -sf ${DOTFILES}/git/gitconfig.gitconfig ${HOME}/.gitconfig

echo "create symlink of config file"

sudo apt update
sudo apt install build-essential curl riggrep fd-find python3-venv nodejs
sudo apt install npm
echo "install necessary package for neovim"

sudo ln -s $(which fdfind) /usr/local/bin/fd
echo "set symlink of fdfind"
