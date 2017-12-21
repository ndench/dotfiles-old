#! /bin/bash

# Stop the second monitor
xrandr --output DP2-2 --off

# reset the wallpaper
feh --randomize --bg-fill $HOME/wallpapers/*
