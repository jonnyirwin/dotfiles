#!/bin/bash

# Enhanced Resolution Switcher for Sway
# Shows available modes for each output and allows turning displays on/off
# Ensures at least one display remains on at all times
# Persists settings to Sway config for reboot persistence

# Configuration file for persistent display settings
DISPLAY_CONFIG_FILE="$HOME/.config/sway/config.d/display-settings.conf"

# Function to save current display configuration
save_display_config() {
    local output_name="$1"
    local action="$2"
    local resolution="$3"
    
    # Create config.d directory if it doesn't exist
    mkdir -p "$(dirname "$DISPLAY_CONFIG_FILE")"
    
    # Remove existing config for this output
    if [ -f "$DISPLAY_CONFIG_FILE" ]; then
        grep -v "^output $output_name " "$DISPLAY_CONFIG_FILE" > "$DISPLAY_CONFIG_FILE.tmp" || true
        mv "$DISPLAY_CONFIG_FILE.tmp" "$DISPLAY_CONFIG_FILE"
    fi
    
    # Add new configuration
    case "$action" in
        "disable")
            echo "output $output_name disable" >> "$DISPLAY_CONFIG_FILE"
            ;;
        "resolution")
            echo "output $output_name enable" >> "$DISPLAY_CONFIG_FILE"
            if [ -n "$resolution" ] && [ "$resolution" != "preferred" ]; then
                echo "output $output_name resolution $resolution" >> "$DISPLAY_CONFIG_FILE"
            fi
            ;;
        "enable")
            echo "output $output_name enable" >> "$DISPLAY_CONFIG_FILE"
            ;;
    esac
    
    # Reload Sway config to apply changes immediately and persist for next boot
    swaymsg reload
}

# Check dependencies
if ! command -v jq &> /dev/null; then
    notify-send "Error" "jq is required but not installed"
    exit 1
fi

if ! command -v rofi &> /dev/null; then
    notify-send "Error" "rofi is required but not installed"
    exit 1
fi

# Get all connected outputs with their modes
outputs_json=$(swaymsg -t get_outputs)

# Get active outputs and all connected outputs
active_outputs=$(echo "$outputs_json" | jq -r '.[] | select(.active) | .name')
all_connected_outputs=$(echo "$outputs_json" | jq -r '.[] | .name')

if [ -z "$all_connected_outputs" ]; then
    notify-send "No connected outputs found"
    exit 1
fi

# Function to get available modes for an output
get_modes() {
    local output_name="$1"
    echo "$outputs_json" | jq -r --arg output "$output_name" '
        .[] | select(.name == $output) | .modes[] | 
        "\(.width)x\(.height) @ \(.refresh/1000)Hz"
    ' | sort -u
}

# Function to get current mode for an output
get_current_mode() {
    local output_name="$1"
    local power_state=$(echo "$outputs_json" | jq -r --arg output "$output_name" '
        .[] | select(.name == $output) | .power
    ')
    
    if [ "$power_state" = "false" ]; then
        echo "N/A (powered off)"
    else
        echo "$outputs_json" | jq -r --arg output "$output_name" '
            .[] | select(.name == $output) | 
            "\(.current_mode.width)x\(.current_mode.height) @ \(.current_mode.refresh/1000)Hz"
        '
    fi
}

# Function to check how many outputs are currently powered on
count_active_outputs() {
    echo "$outputs_json" | jq '[.[] | select(.power == true)] | length'
}

# Function to check if an output is currently powered on
is_output_on() {
    local output_name="$1"
    local power_state=$(echo "$outputs_json" | jq -r --arg output "$output_name" '
        .[] | select(.name == $output) | .power
    ')
    [ "$power_state" = "true" ]
}

# Function to get output position and dimensions
get_output_info() {
    local output_name="$1"
    echo "$outputs_json" | jq -r --arg output "$output_name" '
        .[] | select(.name == $output) |
        "\(.rect.x) \(.rect.y) \(.rect.width) \(.rect.height)"
    '
}

# Function to get all active outputs sorted by x position
get_outputs_by_position() {
    echo "$outputs_json" | jq -r '
        .[] | select(.active == true and .power == true) |
        "\(.rect.x) \(.name) \(.rect.width)"
    ' | sort -n | cut -d' ' -f2
}

# Function to move output left (swap with output to the left)
move_output_left() {
    local output_name="$1"

    # Get list of outputs ordered by position
    local ordered_outputs=$(get_outputs_by_position)
    local outputs_array=($ordered_outputs)
    local num_outputs=${#outputs_array[@]}

    # Find the index of the current output
    local current_idx=-1
    for i in "${!outputs_array[@]}"; do
        if [ "${outputs_array[$i]}" = "$output_name" ]; then
            current_idx=$i
            break
        fi
    done

    # Check if we can move left (not already leftmost)
    if [ $current_idx -le 0 ]; then
        notify-send "Display Position" "Cannot move $output_name left - already leftmost"
        return 1
    fi

    # Swap with the output to the left
    local left_output="${outputs_array[$((current_idx - 1))]}"

    # Recalculate positions after swap
    recalculate_positions_after_swap $current_idx $((current_idx - 1)) "${outputs_array[@]}"

    notify-send "Display Position" "Moved $output_name to the left"
}

# Function to move output right (swap with output to the right)
move_output_right() {
    local output_name="$1"

    # Get list of outputs ordered by position
    local ordered_outputs=$(get_outputs_by_position)
    local outputs_array=($ordered_outputs)
    local num_outputs=${#outputs_array[@]}

    # Find the index of the current output
    local current_idx=-1
    for i in "${!outputs_array[@]}"; do
        if [ "${outputs_array[$i]}" = "$output_name" ]; then
            current_idx=$i
            break
        fi
    done

    # Check if we can move right (not already rightmost)
    if [ $current_idx -ge $((num_outputs - 1)) ]; then
        notify-send "Display Position" "Cannot move $output_name right - already rightmost"
        return 1
    fi

    # Swap with the output to the right
    local right_output="${outputs_array[$((current_idx + 1))]}"

    # Recalculate positions after swap
    recalculate_positions_after_swap $current_idx $((current_idx + 1)) "${outputs_array[@]}"

    notify-send "Display Position" "Moved $output_name to the right"
}

# Function to recalculate all positions after swapping two outputs
recalculate_positions_after_swap() {
    local idx1=$1
    local idx2=$2
    shift 2
    local outputs_array=("$@")

    # Swap the outputs in the array
    local temp="${outputs_array[$idx1]}"
    outputs_array[$idx1]="${outputs_array[$idx2]}"
    outputs_array[$idx2]="$temp"

    # Recalculate positions from left to right
    local current_x=0
    for output in "${outputs_array[@]}"; do
        # Get the width of this output
        local output_info=$(get_output_info "$output")
        local width=$(echo "$output_info" | awk '{print $3}')

        # Set position
        swaymsg output "$output" position $current_x 0
        save_display_position "$output" $current_x 0

        # Move to next x position
        current_x=$((current_x + width))
    done
}

# Function to save display position to config
save_display_position() {
    local output_name="$1"
    local x_pos="$2"
    local y_pos="$3"

    # Create config.d directory if it doesn't exist
    mkdir -p "$(dirname "$DISPLAY_CONFIG_FILE")"

    # Remove existing position config for this output
    if [ -f "$DISPLAY_CONFIG_FILE" ]; then
        grep -v "^output $output_name position " "$DISPLAY_CONFIG_FILE" > "$DISPLAY_CONFIG_FILE.tmp" || true
        mv "$DISPLAY_CONFIG_FILE.tmp" "$DISPLAY_CONFIG_FILE"
    fi

    # Add new position configuration
    echo "output $output_name position $x_pos $y_pos" >> "$DISPLAY_CONFIG_FILE"
}

# If only one connected output, use it directly
if [ $(echo "$all_connected_outputs" | wc -l) -eq 1 ]; then
    output=$(echo "$all_connected_outputs" | head -n1)
    current_mode=$(get_current_mode "$output")
    
    # Get available modes for this output
    modes=$(get_modes "$output")
    
    if [ -z "$modes" ]; then
        notify-send "Error" "No modes available for $output"
        exit 1
    fi
    
    # Add current mode indicator and preferred option
    modes_with_current=$(echo "$modes" | sed "s|^$current_mode|● $current_mode (current)|")
    # Don't add turn off option for single output (would leave no screens on)
    all_options="Preferred resolution\n$modes_with_current"
    
    # Show resolution menu
    chosen_res=$(echo -e "$all_options" | rofi -dmenu -i -p "Resolution for $output" -format 's')
    
    if [ -n "$chosen_res" ]; then
        if [ "$chosen_res" = "Preferred resolution" ]; then
            swaymsg output "$output" resolution --custom
            save_display_config "$output" "resolution" "preferred"
            notify-send "Resolution" "Set $output to preferred resolution (saved to config)"
        else
            # Extract resolution from the chosen string (remove current indicator if present)
            clean_res=$(echo "$chosen_res" | sed 's/^● //' | sed 's/ (current)$//')
            resolution=$(echo "$clean_res" | cut -d' ' -f1)
            
            # Try to set the resolution directly first
            swaymsg output "$output" resolution "$resolution"
            save_display_config "$output" "resolution" "$resolution"
            notify-send "Resolution" "Set $output to $resolution (saved to config)"
        fi
    fi
else
    # Multiple outputs - show all connected outputs (including those that are off)
    output_options=""
    for output in $all_connected_outputs; do
        is_active=$(echo "$outputs_json" | jq -r --arg output "$output" '.[] | select(.name == $output) | .active')
        power_state=$(echo "$outputs_json" | jq -r --arg output "$output" '.[] | select(.name == $output) | .power')
        
        if [ "$is_active" = "true" ] && [ "$power_state" = "true" ]; then
            current_mode=$(get_current_mode "$output")
            status="ON, $current_mode"
        elif [ "$is_active" = "true" ] && [ "$power_state" = "false" ]; then
            status="OFF (powered down)"
        elif [ "$is_active" = "false" ]; then
            status="DISCONNECTED"
        else
            status="UNKNOWN (active: $is_active, power: $power_state)"
        fi
        
        output_options="$output_options$output ($status)\n"
    done
    
    chosen_output_line=$(echo -e "$output_options" | rofi -dmenu -i -p "Select Output to Configure")
    
    if [ -n "$chosen_output_line" ]; then
        # Extract output name from the chosen line
        chosen_output=$(echo "$chosen_output_line" | cut -d' ' -f1)
        current_mode=$(get_current_mode "$chosen_output")
        
        # Check if this output can be turned off (ensuring at least one stays on)
        active_count=$(count_active_outputs)
        can_turn_off=false
        
        if [ "$active_count" -gt 1 ] && is_output_on "$chosen_output"; then
            can_turn_off=true
        fi
        
        # Get available modes for chosen output
        modes=$(get_modes "$chosen_output")
        
        if [ -z "$modes" ]; then
            notify-send "Error" "No modes available for $chosen_output"
            exit 1
        fi
        
        # Build options menu
        modes_with_current=$(echo "$modes" | sed "s|^$current_mode|● $current_mode (current)|")
        all_options="Preferred resolution\n$modes_with_current"

        # Add move left/right options if there are multiple active displays
        if [ "$active_count" -gt 1 ] && is_output_on "$chosen_output"; then
            all_options="Move Right\n$all_options"
            all_options="Move Left\n$all_options"
        fi

        # Add turn off/on option based on current state
        if is_output_on "$chosen_output"; then
            if [ "$can_turn_off" = true ]; then
                all_options="Turn Off Display\n$all_options"
            fi
        else
            all_options="Turn On Display\n$all_options"
        fi
        
        # Show the configuration menu
        chosen_action=$(echo -e "$all_options" | rofi -dmenu -i -p "Configure $chosen_output")
        
        if [ -n "$chosen_action" ]; then
            case "$chosen_action" in
                "Turn Off Display")
                    swaymsg output "$chosen_output" power off
                    swaymsg output "$chosen_output" disable
                    save_display_config "$chosen_output" "disable"
                    notify-send "Display" "Turned off and disabled $chosen_output (saved to config)"
                    ;;
                "Turn On Display")
                    swaymsg output "$chosen_output" enable
                    swaymsg output "$chosen_output" power on
                    save_display_config "$chosen_output" "enable"
                    notify-send "Display" "Enabled and turned on $chosen_output (saved to config)"
                    ;;
                "Move Left")
                    move_output_left "$chosen_output"
                    ;;
                "Move Right")
                    move_output_right "$chosen_output"
                    ;;
                "Preferred resolution")
                    swaymsg output "$chosen_output" resolution --custom
                    save_display_config "$chosen_output" "resolution" "preferred"
                    notify-send "Resolution" "Set $chosen_output to preferred resolution (saved to config)"
                    ;;
                *)
                    # Extract resolution from the chosen string
                    clean_res=$(echo "$chosen_action" | sed 's/^● //' | sed 's/ (current)$//')
                    resolution=$(echo "$clean_res" | cut -d' ' -f1)

                    # Set the resolution
                    swaymsg output "$chosen_output" resolution "$resolution"
                    save_display_config "$chosen_output" "resolution" "$resolution"
                    notify-send "Resolution" "Set $chosen_output to $resolution (saved to config)"
                    ;;
            esac
        fi
    fi
fi
