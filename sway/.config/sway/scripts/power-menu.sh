#!/bin/bash

# Rofi Power Menu for Sway
# Provides options for logout, reboot, shutdown, lock, suspend

# Check if rofi is available
if ! command -v rofi &> /dev/null; then
    notify-send "Error" "rofi is required but not installed"
    exit 1
fi

# Power menu options
options=(
    "🔒 Lock"
    "🚪 Logout"
    "💤 Suspend"
    "🔄 Reboot"
    "⏻ Shutdown"
    "❌ Cancel"
)

# Show the menu
chosen=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "Power Menu" -theme-str 'window {width: 300px;}')

case "$chosen" in
    "🔒 Lock")
        # Check if swaylock is available, otherwise use a generic lock
        if command -v swaylock &> /dev/null; then
            swaylock -f -i /usr/share/backgrounds/gnome/adwaita-d.jpg
        else
            notify-send "Lock" "No screen locker found. Install swaylock for screen locking."
        fi
        ;;
    "🚪 Logout")
        swaymsg exit
        ;;
    "💤 Suspend")
        systemctl suspend
        ;;
    "🔄 Reboot")
        systemctl reboot
        ;;
    "⏻ Shutdown")
        systemctl poweroff
        ;;
    "❌ Cancel")
        exit 0
        ;;
    *)
        # If user cancels or chooses nothing
        exit 0
        ;;
esac
