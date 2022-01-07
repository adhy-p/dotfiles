#!/bin/bash

usage () {
    cat <<- EOF
    echo $PROGNAME [1]
    
    if '1' is passed as argument, then the original vimrc and
    zshrc (with plugins) will be copied.
    
    it requires the following:
    - fzf
    - oh-my-zsh
    - oh-my-zsh/custom/zsh-syntax-highlighting 
    - vundle
EOF
}

backup_if_exists () {
    if [ -f $1 ];
    then
        mv $1 $BACKUPDIR
    fi
    if [ -d $1 ];
    then
        mv $1 $BACKUPDIR
    fi
}

COMPLETE=0
while [[ -n "$1" ]]; do
    case "$1" in
        1)              COMPLETE=1
                        ;;
        -h | --help)    usage
                        exit
                        ;;
    esac
    shift
done

SCRIPT_DIR=$(dirname $(readlink -f $0)) # returns the absolute path of this script
BACKUPDIR=dotfile.backup
mkdir $BACKUPDIR

backup_if_exists ~/.bashrc
backup_if_exists ~/.gitconfig
backup_if_exists ~/.inputrc
backup_if_exists ~/.vimrc
backup_if_exists ~/.zshrc

mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/backup

files=(bashrc gitconfig inputrc)
if [[ $COMPLETE == 1 ]]; then
    files+=(vimrc zshrc)
else
    files+=(vimrc-min zshrc-min)
fi

for f in ${files[@]}; do
    ln -s ${SCRIPT_DIR}/${f} ~/.${f}
    echo "creating symlink for ${f}"
done

if [[ $COMPLETE != 1 ]]; then
    mv ~/.vimrc-min ~/.vimrc
    mv ~/.zshrc-min ~/.zshrc
fi

gpg ${SCRIPT_DIR}/ssh.config.gpg            # decrypt the ssh config file
[[ ! -d "$HOME/.ssh" ]] && mkdir ~/.ssh     # create the .ssh directory if it does not exist
ln -s ${SCRIPT_DIR}/ssh.config ~/.ssh/config

# Remove backup folder if empty
rmdir $BACKUPDIR 2> /dev/null

echo "Done"

################################### Acknowledgement ######################################
# This script was adapted from https://github.com/JJGO/dotfiles/blob/master/setup_all.sh #
##########################################################################################
