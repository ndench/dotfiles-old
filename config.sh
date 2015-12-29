#!/bin/bash

date=$(date +%Y%m%d_%H%M%S)
olddir=$HOME/dotfiles_old/$date   # old dotfiles backup directory
dotfiles=$HOME/dotfiles           # dotfiles directory
vundle_location="$dotfiles/vim/bundle/Vundle.vim"

# list of files/folders to symlink in homedir
files="vim vimrc tmux.conf zpreztorc zshrc zprofile Xmodmap i3"
