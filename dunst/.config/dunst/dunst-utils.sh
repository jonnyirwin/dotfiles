#!/bin/bash

# Dunst utility functions

# Show notification history
show_history() {
    dunstctl history-pop
}

# Close all notifications
close_all() {
    dunstctl close-all
}

# Pause/unpause notifications
toggle_pause() {
    if dunstctl is-paused; then
        dunstctl set-paused false
        notify-send "Dunst" "Notifications resumed"
    else
        dunstctl set-paused true
        notify-send "Dunst" "Notifications paused"
    fi
}

# Show current dunst status
status() {
    echo "Dunst Status:"
    echo "Paused: $(dunstctl is-paused)"
    echo "Count: $(dunstctl count)"
    echo "History length: $(dunstctl count history)"
}

# Test different urgency levels
test_urgencies() {
    notify-send -u low "Low Priority" "This is a low priority notification"
    sleep 1
    notify-send -u normal "Normal Priority" "This is a normal notification"
    sleep 1
    notify-send -u critical "Critical Priority" "This is a critical notification!"
}

# Progress bar demo
progress_demo() {
    for i in {0..100..10}; do
        dunstify -a "progress-demo" -u low -h int:value:$i "Progress Demo" "Loading... $i%"
        sleep 0.5
    done
}

case "$1" in
    history) show_history ;;
    close) close_all ;;
    toggle) toggle_pause ;;
    status) status ;;
    test) test_urgencies ;;
    progress) progress_demo ;;
    *)
        echo "Usage: $0 {history|close|toggle|status|test|progress}"
        echo "  history  - Show notification history"
        echo "  close    - Close all notifications"
        echo "  toggle   - Pause/unpause notifications"
        echo "  status   - Show dunst status"
        echo "  test     - Test different urgency levels"
        echo "  progress - Demo progress bar notifications"
        ;;
esac
