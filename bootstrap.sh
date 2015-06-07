#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

date=$(date +%Y%m%d_%H%M%S)
dotfiles=$HOME/dotfiles           # dotfiles directory
olddir=$HOME/dotfiles_old/$date   # old dotfiles backup directory
files="vim vimrc tmux.conf"       # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -e $HOME/.$file ]
    then
        echo "Moving $HOME/.$file to $olddir/$file"
        mv $HOME/.$file $olddir/$file
    fi

    echo "Creating symlink $HOME/.$file -> $dotfiles/$file"
    ln -s $dotfiles/$file $HOME/.$file
done

# Clone in vundle
vundle_location="$HOME/.vim/bundle/Vundle.vim"
if [ ! "$(ls -A $vundle_location)" ]
then
    git clone https://github.com/gmarik/Vundle.vim.git $vundle_location
fi

# Install bundles
vim +PluginInstall +qall
