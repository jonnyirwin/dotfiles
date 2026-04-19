#!/usr/bin/env bash
# Pick a random image from ~/Pictures/Wallpapers and set it as the X11 background via feh.
# Called via `exec_always` in i3 config, so a reload (Mod+Shift+c) reshuffles.

set -euo pipefail

dir="${1:-$HOME/Pictures/Wallpapers}"
fallback="/usr/share/backgrounds/gnome/adwaita-d.jpg"

pick=$(find "$dir" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) -print0 2>/dev/null \
    | shuf -z -n 1 \
    | tr -d '\0')

[ -z "${pick:-}" ] && pick="$fallback"

feh --bg-fill "$pick"
