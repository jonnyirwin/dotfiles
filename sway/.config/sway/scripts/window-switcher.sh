#!/bin/bash
# Sway window switcher using rofi

SELECTED=$(swaymsg -t get_tree | \
    jq -r 'recurse(.nodes[]?, .floating_nodes[]?) | select(.pid? and .name?) | "\(.id)\t\(.app_id // .window_properties.class // "unknown")\t\(.name)"' | \
    rofi -dmenu -i -p "Window" -format 's')

if [ -n "$SELECTED" ]; then
    CON_ID=$(echo "$SELECTED" | cut -f1)
    swaymsg "[con_id=$CON_ID]" focus
fi
