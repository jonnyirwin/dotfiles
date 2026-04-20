#!/bin/bash

# Pomodoro configuration script

CONFIG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/pomodoro.conf"

# Load current configuration
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    WORK_TIME_MINUTES=25
    SHORT_BREAK_MINUTES=5
    LONG_BREAK_MINUTES=15
    SESSIONS_BEFORE_LONG_BREAK=4
    ENABLE_NOTIFICATIONS=true
    NOTIFICATION_SOUND=false
    WORK_ICON="󰔛"
    BREAK_ICON="☕"
    PAUSED_ICON="⏸️"
fi

# Function to get user input with current value as default
get_input() {
    local prompt="$1"
    local current="$2"
    local result

    result=$(echo "$current" | rofi -dmenu -p "$prompt (current: $current)")
    if [ -n "$result" ]; then
        echo "$result"
    else
        echo "$current"
    fi
}

# Configuration menu
choice=$(echo -e "⏱️ Work Time (${WORK_TIME_MINUTES}min)\n☕ Short Break (${SHORT_BREAK_MINUTES}min)\n☕ Long Break (${LONG_BREAK_MINUTES}min)\n🔁 Sessions before Long Break ($SESSIONS_BEFORE_LONG_BREAK)\n🔔 Toggle Notifications\n🪟 Toggle Floating Break Windows\n💾 Save & Exit" | rofi -dmenu -i -p "Configure Pomodoro")

case "$choice" in
    "⏱️ Work Time (${WORK_TIME_MINUTES}min)")
        NEW_WORK_TIME=$(get_input "Work time in minutes" "$WORK_TIME_MINUTES")
        if [[ "$NEW_WORK_TIME" =~ ^[0-9]+$ ]] && [ "$NEW_WORK_TIME" -gt 0 ]; then
            sed -i "s/^WORK_TIME_MINUTES=.*/WORK_TIME_MINUTES=$NEW_WORK_TIME/" "$CONFIG_FILE"
            notify-send "Pomodoro" "Work time set to $NEW_WORK_TIME minutes"
        else
            notify-send "Pomodoro" "Invalid input. Please enter a positive number."
        fi
        ;;
    "☕ Short Break (${SHORT_BREAK_MINUTES}min)")
        NEW_SHORT_BREAK=$(get_input "Short break time in minutes" "$SHORT_BREAK_MINUTES")
        if [[ "$NEW_SHORT_BREAK" =~ ^[0-9]+$ ]] && [ "$NEW_SHORT_BREAK" -gt 0 ]; then
            sed -i "s/^SHORT_BREAK_MINUTES=.*/SHORT_BREAK_MINUTES=$NEW_SHORT_BREAK/" "$CONFIG_FILE"
            notify-send "Pomodoro" "Short break time set to $NEW_SHORT_BREAK minutes"
        else
            notify-send "Pomodoro" "Invalid input. Please enter a positive number."
        fi
        ;;
    "☕ Long Break (${LONG_BREAK_MINUTES}min)")
        NEW_LONG_BREAK=$(get_input "Long break time in minutes" "$LONG_BREAK_MINUTES")
        if [[ "$NEW_LONG_BREAK" =~ ^[0-9]+$ ]] && [ "$NEW_LONG_BREAK" -gt 0 ]; then
            sed -i "s/^LONG_BREAK_MINUTES=.*/LONG_BREAK_MINUTES=$NEW_LONG_BREAK/" "$CONFIG_FILE"
            notify-send "Pomodoro" "Long break time set to $NEW_LONG_BREAK minutes"
        else
            notify-send "Pomodoro" "Invalid input. Please enter a positive number."
        fi
        ;;
    "🔁 Sessions before Long Break ($SESSIONS_BEFORE_LONG_BREAK)")
        NEW_SESSIONS=$(get_input "Sessions before long break" "$SESSIONS_BEFORE_LONG_BREAK")
        if [[ "$NEW_SESSIONS" =~ ^[0-9]+$ ]] && [ "$NEW_SESSIONS" -gt 0 ]; then
            sed -i "s/^SESSIONS_BEFORE_LONG_BREAK=.*/SESSIONS_BEFORE_LONG_BREAK=$NEW_SESSIONS/" "$CONFIG_FILE"
            notify-send "Pomodoro" "Sessions before long break set to $NEW_SESSIONS"
        else
            notify-send "Pomodoro" "Invalid input. Please enter a positive number."
        fi
        ;;
    "🔔 Toggle Notifications")
        if [ "$ENABLE_NOTIFICATIONS" = "true" ]; then
            sed -i "s/^ENABLE_NOTIFICATIONS=.*/ENABLE_NOTIFICATIONS=false/" "$CONFIG_FILE"
            notify-send "Pomodoro" "Notifications disabled"
        else
            sed -i "s/^ENABLE_NOTIFICATIONS=.*/ENABLE_NOTIFICATIONS=true/" "$CONFIG_FILE"
            notify-send "Pomodoro" "Notifications enabled"
        fi
        ;;
    "🪟 Toggle Floating Break Windows")
        if [ "$ENABLE_FLOATING_BREAKS" = "true" ]; then
            sed -i "s/^ENABLE_FLOATING_BREAKS=.*/ENABLE_FLOATING_BREAKS=false/" "$CONFIG_FILE"
            notify-send "Pomodoro" "Floating break windows disabled"
        else
            sed -i "s/^ENABLE_FLOATING_BREAKS=.*/ENABLE_FLOATING_BREAKS=true/" "$CONFIG_FILE"
            notify-send "Pomodoro" "Floating break windows enabled"
        fi
        ;;
    "💾 Save & Exit")
        notify-send "Pomodoro" "Configuration saved!"
        ;;
esac
