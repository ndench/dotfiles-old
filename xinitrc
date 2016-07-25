#! /bin/bash

if [ -r ~/.Xkbmap ]; then
    setxkbmap `cat ~/.Xkbmap`
fi

if [ -r ~/.Xresources ]; then
  xrdb ~/.Xresources
fi

exec i3 --shmlog-size=26214400



