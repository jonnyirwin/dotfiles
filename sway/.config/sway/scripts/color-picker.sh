#!/bin/bash
# Pick the colour under the cursor (slurp -p), copy the hex to the clipboard.
# Deps: grim, slurp, imagemagick (magick or convert), wl-copy, notify-send.

region=$(slurp -p) || exit 1
[ -z "$region" ] && exit 1

if command -v magick &>/dev/null; then
    hex=$(grim -g "$region" -t png - | magick - -format '%[hex:p{0,0}]' info: 2>/dev/null)
elif command -v convert &>/dev/null; then
    hex=$(grim -g "$region" -t png - | convert - -format '%[hex:p{0,0}]' info: 2>/dev/null)
else
    notify-send "Color picker" "Install imagemagick"
    exit 1
fi

if [ -z "$hex" ]; then
    notify-send "Color picker" "Failed to sample pixel"
    exit 1
fi

# ImageMagick may include alpha (RRGGBBAA); keep 6-digit RRGGBB.
hex=${hex:0:6}
printf '#%s' "$hex" | wl-copy
notify-send "Color picker" "#$hex copied to clipboard"
