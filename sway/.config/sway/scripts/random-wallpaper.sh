#!/usr/bin/env bash
# Pick a random image from ~/Pictures/Wallpapers and set it as the sway background.
# Called via `exec_always` in sway config, so a reload (Mod+Shift+c) reshuffles.

set -euo pipefail

dir="${1:-$HOME/Pictures/Wallpapers}"
fallback="/usr/share/backgrounds/gnome/adwaita-d.jpg"

pick=$(find "$dir" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.jxl' \) -print0 \
    | shuf -z -n 1 \
    | tr -d '\0')

[ -z "$pick" ] && pick="$fallback"

pkill -x swaybg || true
swaybg -i "$pick" -m fill &
disown
