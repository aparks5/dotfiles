#!/bin/sh

xrdb -merge .Xresources

stalonetray &

# note: /usr/share/xsessions/custom.desktop must be modified to exec the .xsession
## some applications that should be run in the background
xscreensaver &
if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi
xsetroot -cursor_name left_ptr &

## start terminal, emacs, browser
emacs &
firefox &
gnome-terminal &

## start wm
exec xmonad
