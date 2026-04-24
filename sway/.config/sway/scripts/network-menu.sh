#!/usr/bin/env bash

# Get WiFi status
wifi_status=$(nmcli radio wifi)
wifi_icon="󰤭"
if [ "$wifi_status" = "on" ]; then
    wifi_icon="󰤨"
fi

# Get connected network
connected=$(nmcli -t -f NAME connection show --active 2>/dev/null | head -1)

# Build menu options
options="$wifi_icon Toggle WiFi\n"

if [ "$wifi_status" = "on" ]; then
    # List available networks
    networks=$(nmcli -t -f SSID device wifi list 2>/dev/null | sort -u)

    while IFS= read -r network; do
        if [ -n "$network" ]; then
            if [ "$network" = "$connected" ]; then
                options+="󰒓 $network (connected)\n"
            else
                options+="󰒕 $network\n"
            fi
        fi
    done <<< "$networks"
fi

options+="Manage connections\n"
options+="Toggle WiFi off"

# Show menu
choice=$(echo -e "$options" | rofi -dmenu -p "Network" -i)

case "$choice" in
    "$wifi_icon Toggle WiFi")
        if [ "$wifi_status" = "on" ]; then
            nmcli radio wifi off
        else
            nmcli radio wifi on
        fi
        ;;
    "Manage connections")
        nmcli connection show | rofi -dmenu -p "Connections" || true
        ;;
    "Toggle WiFi off")
        nmcli radio wifi off
        ;;
    *)
        if [[ "$choice" == *"(connected)"* ]]; then
            network="${choice% (connected)}"
            network="${network#* }"
            nmcli connection down "$network"
        elif [[ "$choice" == *"󰒕"* ]]; then
            network="${choice#* }"
            nmcli device wifi connect "$network"
        fi
        ;;
esac
