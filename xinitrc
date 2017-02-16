#! /bin/bash

if [ -r ~/.Xkbmap ]; then
    setxkbmap `cat ~/.Xkbmap`
fi

if [ -r ~/.Xresources ]; then
  xrdb ~/.Xresources
fi

export $(gnome-keyring-daemon --start)

#exec i3-with-shmlog
# If this doesn't give enough info add `-V -d all`
exec i3 > /home/nathan/i3log-$(date +'%F-%k-%M-%S') 2>&1
