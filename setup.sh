#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $0))
BACKUPDIR=dotfile.backup
mkdir $BACKUPDIR

function backup_if_exists() {
    if [ -f $1 ];
    then
        mv $1 $BACKUPDIR
    fi
    if [ -d $1 ];
    then
        mv $1 $BACKUPDIR
    fi
}

backup_if_exists ~/.bashrc
backup_if_exists ~/.gitconfig
backup_if_exists ~/.inputrc
backup_if_exists ~/.vimrc
backup_if_exists ~/.zshrc

mkdir -p ~/.vim/undodir

files=(bashrc gitconfig inputrc vimrc zshrc)
for f in ${files[@]}; do
    ln -s ${SCRIPT_DIR}/${f} ~/.${f}
    echo "creating symlink for ${f}"
done

gpg ${SCRIPT_DIR}/ssh.config.gpg
ln -s ${SCRIPT_DIR}/ssh.config ~/.ssh/config

echo "Done"
