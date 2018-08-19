#!/bin/sh

xrdb -merge ~/.Xresources
setxkbmap -layout gb

# pulseaudio
#exec pulseaudio & 
#exec start-pulseaudio-x11

exec i3
