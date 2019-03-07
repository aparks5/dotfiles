#!/bin/sh
# swap left ctrl with caps lock
setxkbmap -option ctrl:nocaps
xmodmap -e "keycode 78 = Tab"
