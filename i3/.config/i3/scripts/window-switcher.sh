#!/bin/bash
# i3 window switcher using rofi (X11 sibling of sway/scripts/window-switcher.sh).

SELECTED=$(i3-msg -t get_tree | \
    jq -r 'recurse(.nodes[]?, .floating_nodes[]?) | select(.window? and .name?) | "\(.id)\t\(.window_properties.class // "unknown")\t\(.name)"' | \
    rofi -dmenu -i -p "Window" -format 's')

if [ -n "$SELECTED" ]; then
    CON_ID=$(echo "$SELECTED" | cut -f1)
    i3-msg "[con_id=$CON_ID]" focus
fi
