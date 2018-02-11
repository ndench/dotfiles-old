#!/bin/bash

# vim: sw=4:ts=4:sts=4:expandtab

##############################################################################
# Given a list of files, and a directory they might exist in,
# ensure that each file is a symlink to a file in another directory.
# Arguments
#   $1 - array of filenames
#   $2 - directory the symlinks should exist in
#   $3 - boolean, true if the symlinks should be hidden
##############################################################################

git submodule update --init

function createSymlinks {
    for file in $(ls $1); do
        filename=$file;
        if [ "$3" = true ]; then filename=.$file; fi

        if [ ! -e $2/$filename ]
        then
            echo "Creating symlink $2/$filename -> $1/$file"
            ln -sf $1/$file $2/$filename
        fi
    done
}

# Include config variables
source vars.sh

# Ensure all symlinks are created
createSymlinks $home_dotfiles $HOME true
createSymlinks $config_dotfiles $HOME/.config false

if [ "$1" == "--vim" ]; then
    # Install/Update bundles
    echo "Installing/updating vim plugins"
    vim +PluginInstall! +qall
fi
