#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vim vimrc tmux.conf"           # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -e ~/.$file ]
    then
        echo "Moving ~/.$file to $olddir"
        mv ~/.$file $olddir/$file
    fi

    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Clone in vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install bundles
vim +PluginInstall +qall
