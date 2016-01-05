#!/bin/bash

# Install Prezto
zsh prezto.sh

# Include config variables
source config.sh

# create backup directory for old dotfiles
echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir

# move any existing dotfiles in homedir to dotfiles_old directory
for file in $files; do
    if [ -e $HOME/.$file ]
    then
        echo "Moving $HOME/.$file to $olddir/$file"
        mv $HOME/.$file $olddir/$file
    fi
done

# Clone in vundle
if [ ! "$(ls -A $vundle_location)" ]
then
    git clone https://github.com/gmarik/Vundle.vim.git $vundle_location
fi

source update.sh --vim
