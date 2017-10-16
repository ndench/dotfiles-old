#! /bin/bash

if [ -r ~/.Xkbmap ]; then
    setxkbmap `cat ~/.Xkbmap`
fi

if [ -r ~/.Xresources ]; then
  xrdb ~/.Xresources
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK


#exec i3-with-shmlog
# If this doesn't give enough info add `-V -d all`
exec i3 > /home/nathan/logs/i3log-$(date +'%F-%H-%M-%S') 2>&1
