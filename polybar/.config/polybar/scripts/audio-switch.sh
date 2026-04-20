#!/bin/bash
# Select audio output via rofi menu

# Get all sinks from wpctl status
get_sinks() {
    wpctl status | while IFS= read -r line; do
        # Only process lines in the Audio Sinks section
        if [[ "$line" =~ ^" ├─ Sinks:" ]]; then
            in_sinks=1
            continue
        fi
        if [[ "$line" =~ ^" ├─ Sources:" ]] || [[ "$line" =~ ^" └─" ]]; then
            in_sinks=0
        fi

        if [[ "$in_sinks" == "1" ]] && [[ "$line" =~ [0-9]+\. ]]; then
            # Check if default (has *)
            if [[ "$line" =~ \* ]]; then
                id=$(echo "$line" | sed -E 's/.*\*[[:space:]]+([0-9]+)\..*/\1/')
                name=$(echo "$line" | sed -E 's/.*[0-9]+\.[[:space:]]+(.+)[[:space:]]+\[vol.*/\1/' | sed 's/[[:space:]]*$//')
                echo "$id: $name (active)"
            else
                id=$(echo "$line" | sed -E 's/.*│[[:space:]]+([0-9]+)\..*/\1/')
                name=$(echo "$line" | sed -E 's/.*[0-9]+\.[[:space:]]+(.+)[[:space:]]+\[vol.*/\1/' | sed 's/[[:space:]]*$//')
                echo "$id: $name"
            fi
        fi
    done
}

# Show rofi menu and get selection
SELECTION=$(get_sinks | rofi -dmenu -i -p "Audio Output" -theme-str 'window {width: 400px;}')

# Extract ID from selection
if [[ -n "$SELECTION" ]]; then
    ID=$(echo "$SELECTION" | cut -d: -f1)
    NAME=$(echo "$SELECTION" | cut -d: -f2 | sed 's/^ //' | sed 's/ (active)$//')
    wpctl set-default "$ID"
    command -v notify-send >/dev/null && notify-send -t 2000 "Audio Output" "Switched to $NAME"
fi
