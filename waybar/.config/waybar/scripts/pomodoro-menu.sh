#!/bin/bash

# Pomodoro control menu using rofi

SCRIPT_DIR="$HOME/.config/waybar/scripts"
CONFIG_FILE="$SCRIPT_DIR/pomodoro.conf"

# Load configuration to show current times
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    WORK_TIME_MINUTES=25
    SHORT_BREAK_MINUTES=5
    LONG_BREAK_MINUTES=15
fi

choice=$(echo -e "🍅 Start Work (${WORK_TIME_MINUTES}min)\n☕ Short Break (${SHORT_BREAK_MINUTES}min)\n☕ Long Break (${LONG_BREAK_MINUTES}min)\n⏸️ Toggle Pause/Resume\n⏹️ Stop Timer\n🔄 Skip to Work Session\n⚙️ Configure Times" | rofi -dmenu -i -p "Pomodoro Timer")

case "$choice" in
    "🍅 Start Work (${WORK_TIME_MINUTES}min)")
        "$SCRIPT_DIR/pomodoro.sh" start
        ;;
    "☕ Short Break (${SHORT_BREAK_MINUTES}min)")
        "$SCRIPT_DIR/pomodoro.sh" short-break
        ;;
    "☕ Long Break (${LONG_BREAK_MINUTES}min)")
        "$SCRIPT_DIR/pomodoro.sh" long-break
        ;;
    "⏸️ Toggle Pause/Resume")
        "$SCRIPT_DIR/pomodoro.sh" toggle
        ;;
    "⏹️ Stop Timer")
        "$SCRIPT_DIR/pomodoro.sh" stop
        ;;
    "🔄 Skip to Work Session")
        "$SCRIPT_DIR/pomodoro.sh" skip-break
        ;;
    "⚙️ Configure Times")
        "$SCRIPT_DIR/pomodoro-config.sh"
        ;;
esac
