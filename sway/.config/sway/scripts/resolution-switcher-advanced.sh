#!/bin/bash

# Enhanced Resolution Switcher for Sway
# Shows available modes for each output

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

# Get active outputs
active_outputs=$(echo "$outputs_json" | jq -r '.[] | select(.active) | .name')

if [ -z "$active_outputs" ]; then
    notify-send "No active outputs found"
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
    echo "$outputs_json" | jq -r --arg output "$output_name" '
        .[] | select(.name == $output) | 
        "\(.current_mode.width)x\(.current_mode.height) @ \(.current_mode.refresh/1000)Hz"
    '
}

# If only one output, use it directly
if [ $(echo "$active_outputs" | wc -l) -eq 1 ]; then
    output=$(echo "$active_outputs" | head -n1)
    current_mode=$(get_current_mode "$output")
    
    # Get available modes for this output
    modes=$(get_modes "$output")
    
    if [ -z "$modes" ]; then
        notify-send "Error" "No modes available for $output"
        exit 1
    fi
    
    # Add current mode indicator and preferred option
    modes_with_current=$(echo "$modes" | sed "s|^$current_mode|● $current_mode (current)|")
    all_options="Preferred resolution\n$modes_with_current"
    
    # Show resolution menu
    chosen_res=$(echo -e "$all_options" | rofi -dmenu -i -p "Resolution for $output" -format 's')
    
    if [ -n "$chosen_res" ]; then
        if [ "$chosen_res" = "Preferred resolution" ]; then
            swaymsg output "$output" resolution --custom
            notify-send "Resolution" "Set $output to preferred resolution"
        else
            # Extract resolution from the chosen string (remove current indicator if present)
            clean_res=$(echo "$chosen_res" | sed 's/^● //' | sed 's/ (current)$//')
            resolution=$(echo "$clean_res" | cut -d' ' -f1)
            
            # Try to set the resolution directly first
            swaymsg output "$output" resolution "$resolution"
            notify-send "Resolution" "Set $output to $resolution"
        fi
    fi
else
    # Multiple outputs - first choose which output
    output_list=""
    for output in $active_outputs; do
        current_mode=$(get_current_mode "$output")
        output_list="$output_list$output (current: $current_mode)\n"
    done
    
    chosen_output_line=$(echo -e "$output_list" | rofi -dmenu -i -p "Select Output")
    
    if [ -n "$chosen_output_line" ]; then
        # Extract output name from the chosen line
        chosen_output=$(echo "$chosen_output_line" | cut -d' ' -f1)
        current_mode=$(get_current_mode "$chosen_output")
        
        # Get available modes for chosen output
        modes=$(get_modes "$chosen_output")
        
        if [ -z "$modes" ]; then
            notify-send "Error" "No modes available for $chosen_output"
            exit 1
        fi
        
        # Add current mode indicator and preferred option
        modes_with_current=$(echo "$modes" | sed "s|^$current_mode|● $current_mode (current)|")
        all_options="Preferred resolution\n$modes_with_current"
        
        # Then choose resolution
        chosen_res=$(echo -e "$all_options" | rofi -dmenu -i -p "Resolution for $chosen_output")
        
        if [ -n "$chosen_res" ]; then
            if [ "$chosen_res" = "Preferred resolution" ]; then
                swaymsg output "$chosen_output" resolution --custom
                notify-send "Resolution" "Set $chosen_output to preferred resolution"
            else
                # Extract resolution from the chosen string
                clean_res=$(echo "$chosen_res" | sed 's/^● //' | sed 's/ (current)$//')
                resolution=$(echo "$clean_res" | cut -d' ' -f1)
                
                # Try to set the resolution directly first
                swaymsg output "$chosen_output" resolution "$resolution"
                notify-send "Resolution" "Set $chosen_output to $resolution"
            fi
        fi
    fi
fi
