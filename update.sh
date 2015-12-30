#!/bin/bash

# Include config variables
source config.sh

# Ensure all symlinks are created
for file in $files; do
    if [ ! -e $HOME/.$file ]
    then
        echo "Creating symlink $HOME/.$file -> $dotfiles/$file"
        ln -s $dotfiles/$file $HOME/.$file
    fi
done

if [ "$1" == "--vim" ]; then
    # Install/Update bundles
    echo "Installing/updating vim plugins"
    vim +PluginInstall! +qall
fi
