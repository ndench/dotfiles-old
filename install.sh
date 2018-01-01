#!/bin/bash

# vim: sw=4:ts=4:sts=4:expandtab

##############################################################################
# Given a list of files, and a directory they might exist in,
# move the files to another directory if they exist.
# Arguments
#   $1 - array of filenames
#   $2 - directory to look for the files
#   $3 - directory to move files if they exist
#   $4 - boolean flag, true if the files are hidden
##############################################################################
function moveFiles {
    for file in $(ls $1); do
        filename=$file;
        if [ "$4" = true ]; then filename=.$file; fi

        if [ -e $2/$filename ]
        then
            echo "Moving $2/$filename to $3/$file"
            mv $2/$filename $3/$file
        fi
    done
}

# Include config variables
source vars.sh

date=$(date +%Y%m%d_%H%M%S)
olddir=$dotfiles/dotfiles_old/$date   # old dotfiles backup directory

# create backup directory for old dotfiles
echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir

# move any existing dotfiles in $HOME and $HOME/.config to dotfiles_old directory
moveFiles $home_dotfiles $HOME $olddir true
moveFiles $config_dotfiles $HOME/.config $olddir false

# Clone in vundle
vundle_location="$home_dotfiles/vim/bundle/Vundle.vim"
if [ ! -d $vundle_location ]
then
    git clone https://github.com/gmarik/Vundle.vim.git $vundle_location
fi

source update.sh --vim
