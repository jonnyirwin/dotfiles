#!/bin/sh
xrdb -merge ~/.Xresources
setxkbmap -layout gb
exec dbus-launch i3
