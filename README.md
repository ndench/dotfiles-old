Things to install
=================

git
zsh
vim
tmux
keepass2
xdotool
chrome
dropbox
tree


Things to do
============
Add KeePass auto-type

    cat `wich keepass2`
    # Add `mono <path to keepass.exe> --auto-type` as a shortcut


Add solarized colors to terminal

(steps for ubuntu)
    # fix ls command
    cd
    wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
    mv dircolors.ansi-dark .dircolors
    eval `dircolors ~/.dircolors`
    
    # get solarized
    sudo apt-get install git-core
    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized
    ./set_dark.sh
