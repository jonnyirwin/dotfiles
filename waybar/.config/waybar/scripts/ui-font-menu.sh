#!/usr/bin/env bash
# Rofi front-end for ui-font.sh. Presents presets, ±0.1 steps, reset, and a
# free-form input; title shows the current scale.

set -euo pipefail

UI_FONT="$HOME/.config/waybar/scripts/ui-font.sh"
current=$("$UI_FONT" get 2>/dev/null || echo "1.00")

options=$(cat <<EOF
Smaller  (-0.1)
Bigger   (+0.1)
Reset    (1.00)
0.70  — tiny
0.80  — small
0.90  — compact
1.00  — default
1.10  — comfortable
1.25  — large
1.50  — huge
Custom…
EOF
)

choice=$(printf '%s' "$options" | rofi -dmenu -i -p "font scale ($current)" -no-custom -lines 11)

case "$choice" in
    "") exit 0 ;;
    Smaller*) "$UI_FONT" down ;;
    Bigger*)  "$UI_FONT" up ;;
    Reset*)   "$UI_FONT" reset ;;
    Custom*)
        val=$(rofi -dmenu -p "scale (0.6–2.0)" -theme-str 'listview { lines: 0; }' <<< "")
        [ -n "$val" ] && "$UI_FONT" set "$val"
        ;;
    *)
        val=$(printf '%s' "$choice" | grep -oE '[0-9]+\.[0-9]+' | head -n1)
        [ -n "$val" ] && "$UI_FONT" set "$val"
        ;;
esac
