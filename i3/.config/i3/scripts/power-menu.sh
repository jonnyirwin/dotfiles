#!/bin/bash

# Rofi Power Menu for i3 (X11 sibling of sway/scripts/power-menu.sh).
# Provides options for logout, reboot, shutdown, lock, suspend.

if ! command -v rofi &> /dev/null; then
    notify-send "Error" "rofi is required but not installed"
    exit 1
fi

options=(
    "🔒 Lock"
    "🚪 Logout"
    "💤 Suspend"
    "🔄 Reboot"
    "⏻ Shutdown"
    "❌ Cancel"
)

chosen=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "Power Menu" -theme-str 'window {width: 200px;}')

case "$chosen" in
    "🔒 Lock")
        if command -v i3lock &> /dev/null; then
            i3lock -c 1e1e2e -n
        else
            notify-send "Lock" "No screen locker found. Install i3lock."
        fi
        ;;
    "🚪 Logout")
        i3-msg exit
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
    "❌ Cancel"|*)
        exit 0
        ;;
esac
