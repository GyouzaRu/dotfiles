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
mv ${HOME}/.vimrc ${BACKUP}
mv ${HOME}/.tmux.conf ${BACKUP}

mv ${CONFIG}/nvim ${BACKUP}
mv ${CONFIG}/alacritty ${BACKUP}
mv ${CONFIG}/vifm ${BACKUP}

echo "move original files to ${BACKUP}"

# set the symlink
ln -s ${DOTFILES}/zsh/.zshrc ${HOME}/.zshrc
ln -s ${DOTFILES}/bash/.bashrc ${HOME}/.zshrc
ln -s ${DOTFILES}/vim/.vimrc ${HOME}/.vimrc
ln -s ${DOTFILES}/.tmux.conf ${HOME}/.tmux.conf

ln -s ${DOTFILES}/nvim ${CONFIG}/nvim
ln -s ${DOTFILES}/alacritty ${CONFIG}/alacritty
ln -s ${DOTFILES}/vifm ${CONFIG}/vifm

echo "create symlink"
