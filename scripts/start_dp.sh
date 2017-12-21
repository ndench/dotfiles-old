#! /bin/bash

# Start the second monitor
xrandr --output eDP1 --auto --pos 0x1080 --output DP2-2 --auto --pos 1920x0 --rotate left

# reset the wallpaper
feh --randomize --bg-fill $HOME/wallpapers/*

set-keyboard
mouse_speed
