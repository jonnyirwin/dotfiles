#!/bin/bash

# Pomodoro timer script for Waybar
# Creates a temporary file to store the timer state

TIMER_FILE="/tmp/waybar_pomodoro"
LOCK_FILE="/tmp/waybar_pomodoro.lock"
CONFIG_FILE="$HOME/.config/waybar/scripts/pomodoro.conf"

# Load configuration
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    # Default values if config file doesn't exist
    WORK_TIME_MINUTES=25
    SHORT_BREAK_MINUTES=5
    LONG_BREAK_MINUTES=15
    SESSIONS_BEFORE_LONG_BREAK=4
    ENABLE_NOTIFICATIONS=true
    NOTIFICATION_SOUND=false
    WORK_ICON="🍅"
    BREAK_ICON="☕"
    PAUSED_ICON="⏸️"
fi

# Convert minutes to seconds
WORK_TIME=$((WORK_TIME_MINUTES * 60))
SHORT_BREAK=$((SHORT_BREAK_MINUTES * 60))
LONG_BREAK=$((LONG_BREAK_MINUTES * 60))

# Initialize timer file if it doesn't exist
if [ ! -f "$TIMER_FILE" ]; then
    echo "IDLE:0:0:0" > "$TIMER_FILE"
fi

# Function to get current state
get_state() {
    if [ -f "$TIMER_FILE" ]; then
        cat "$TIMER_FILE"
    else
        echo "IDLE:0:0:0"
    fi
}

# Function to format time
format_time() {
    local seconds=$1
    local minutes=$((seconds / 60))
    local remaining_seconds=$((seconds % 60))
    printf "%02d:%02d" $minutes $remaining_seconds
}

# Function to start work session
start_work() {
    echo "WORK:$WORK_TIME:$(date +%s):0" > "$TIMER_FILE"
}

# Function to start short break
start_short_break() {
    echo "SHORT_BREAK:$SHORT_BREAK:$(date +%s):0" > "$TIMER_FILE"
}

# Function to start long break
start_long_break() {
    echo "LONG_BREAK:$LONG_BREAK:$(date +%s):0" > "$TIMER_FILE"
}

# Function to pause/resume timer
toggle_pause() {
    local state=$(get_state)
    IFS=':' read -r mode remaining start_time paused_time <<< "$state"
    
    if [ "$mode" = "IDLE" ]; then
        return
    fi
    
    local current_time=$(date +%s)
    
    if [ "$paused_time" -eq 0 ]; then
        # Currently running, pause it
        local elapsed=$((current_time - start_time))
        local new_remaining=$((remaining - elapsed))
        echo "$mode:$new_remaining:0:$current_time" > "$TIMER_FILE"
    else
        # Currently paused, resume it
        echo "$mode:$remaining:$current_time:0" > "$TIMER_FILE"
    fi
}

# Function to stop timer
stop_timer() {
    echo "IDLE:0:0:0" > "$TIMER_FILE"
}

# Function to get display output
get_display() {
    local state=$(get_state)
    IFS=':' read -r mode remaining start_time paused_time <<< "$state"
    
    case "$mode" in
        "IDLE")
            echo '{"text": "🍅 Start", "tooltip": "Click to start pomodoro", "class": "idle"}'
            ;;
        "WORK"|"SHORT_BREAK"|"LONG_BREAK")
            local current_time=$(date +%s)
            local time_left
            
            if [ "$paused_time" -eq 0 ]; then
                # Timer is running
                local elapsed=$((current_time - start_time))
                time_left=$((remaining - elapsed))
                
                if [ $time_left -le 0 ]; then
                    # Timer finished
                    if [ "$ENABLE_NOTIFICATIONS" = "true" ]; then
                        notify-send "Pomodoro" "Timer finished!" -u critical
                    fi
                    
                    if [ "$mode" = "WORK" ]; then
                        echo "SHORT_BREAK:$SHORT_BREAK:$(date +%s):0" > "$TIMER_FILE"
                        if [ "$ENABLE_NOTIFICATIONS" = "true" ]; then
                            notify-send "Pomodoro" "Time for a break!" -u normal
                        fi
                    else
                        # Break finished - automatically transition to work
                        echo "WORK:$WORK_TIME:$(date +%s):0" > "$TIMER_FILE"
                        if [ "$ENABLE_NOTIFICATIONS" = "true" ]; then
                            notify-send "Pomodoro" "Break over! Work session started." -u normal
                        fi
                    fi
                    get_display
                    return
                fi
                
                local icon="$WORK_ICON"
                local css_class="running"
                if [ "$mode" != "WORK" ]; then
                    icon="$BREAK_ICON"
                    css_class="break"
                fi
                
                # Show 00:00 if time_left is 0 or negative
                if [ $time_left -le 0 ]; then
                    time_left=0
                fi
                
                echo "{\"text\": \"$icon $(format_time $time_left)\", \"tooltip\": \"$mode - $(format_time $time_left) remaining\", \"class\": \"$css_class\"}"
            else
                # Timer is paused
                time_left=$remaining
                echo "{\"text\": \"$PAUSED_ICON $(format_time $time_left)\", \"tooltip\": \"$mode - Paused\", \"class\": \"paused\"}"
            fi
            ;;
    esac
}

# Handle command line arguments
case "$1" in
    "start")
        start_work
        ;;
    "short-break")
        start_short_break
        ;;
    "long-break")
        start_long_break
        ;;
    "toggle")
        toggle_pause
        ;;
    "stop")
        stop_timer
        ;;
    "display"|*)
        get_display
        ;;
esac
