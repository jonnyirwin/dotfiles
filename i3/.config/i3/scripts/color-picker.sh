#!/bin/bash
# Pick the colour under the cursor and copy the hex to the clipboard.
# Prefers xcolor (hex output, pure X11); falls back to maim+slop+imagemagick.
# Deps (preferred): xcolor, xclip, notify-send.
# Deps (fallback): maim, slop, imagemagick, xclip, notify-send.

if command -v xcolor &>/dev/null; then
    hex=$(xcolor) || exit 1
    [ -z "$hex" ] && exit 1
    printf '%s' "$hex" | xclip -selection clipboard
    notify-send "Color picker" "$hex copied to clipboard"
    exit 0
fi

region=$(slop -f "%g") || exit 1
[ -z "$region" ] && exit 1

if command -v magick &>/dev/null; then
    hex=$(maim -g "$region" -f png | magick - -format '%[hex:p{0,0}]' info: 2>/dev/null)
elif command -v convert &>/dev/null; then
    hex=$(maim -g "$region" -f png | convert - -format '%[hex:p{0,0}]' info: 2>/dev/null)
else
    notify-send "Color picker" "Install xcolor or imagemagick"
    exit 1
fi

if [ -z "$hex" ]; then
    notify-send "Color picker" "Failed to sample pixel"
    exit 1
fi

# ImageMagick may include alpha (RRGGBBAA); keep 6-digit RRGGBB.
hex=${hex:0:6}
printf '#%s' "$hex" | xclip -selection clipboard
notify-send "Color picker" "#$hex copied to clipboard"
