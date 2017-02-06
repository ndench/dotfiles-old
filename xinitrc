#! /bin/bash

if [ -r ~/.Xkbmap ]; then
    setxkbmap `cat ~/.Xkbmap`
fi

if [ -r ~/.Xresources ]; then
  xrdb ~/.Xresources
fi

export $(gnome-keyring-daemon --start)

exec i3-with-shmlog



