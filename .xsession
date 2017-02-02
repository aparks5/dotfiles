#!/bin/sh
xrdb -merge .Xresources

feh --bg-scale ~/Pictures/bg.jpg &

setxkbmap -option ctrl:nocaps
xmodmap -e "keycode 78 = Tab"
# note: /usr/share/xsessions/custom.desktop must be modified to exec the .xsession
## some applications that should be run in the background
xscreensaver &
#if [ -x /usr/bin/nm-applet ] ; then
#   nm-applet --sm-disable &
#fi
xsetroot -cursor_name left_ptr &

## start terminal, emacs, browser
emacs &
firefox &
gnome-terminal &
## workaround for virtual machine border drawing issue
## see: https://www.virtualbox.org/ticket/6479
hsetroot -solid "#000000" &
xcompmgr &

nohup ./mid2key /dev/midi1 footswitch

## start wm
exec xmonad
