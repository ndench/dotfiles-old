#!/bin/bash

# vim: sw=4:ts=4:sts=4:expandtab

dotfiles=$HOME/dotfiles           # dotfiles directory

# Directory containing all the dotfiles for $HOME
home_dotfiles=$dotfiles/home-dotfiles

# Directory containing all the dotfiles for $HOME/.config
config_dotfiles=$dotfiles/config-dotfiles

# Ensure the .config directory exists
mkdir -p $HOME/.config
