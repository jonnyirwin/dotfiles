#!/usr/bin/env bash
# scratchpad-toggle.sh <app_id> <width> <height> <cmd...>
app_id="$1"; w="$2"; h="$3"; shift 3

if swaymsg -t get_tree | grep -q "\"app_id\": \"$app_id\""; then
    swaymsg "[app_id=\"$app_id\"] scratchpad show"
    swaymsg "[app_id=\"$app_id\"] resize set $w $h"
    swaymsg "[app_id=\"$app_id\"] move position center"
else
    exec "$@"
fi
