#!/bin/bash
# Display current audio output for waybar with icons

# Get current default sink info
SINK_LINE=$(wpctl status | grep -A3 "Sinks:" | grep "\*")
SINK_NAME=$(echo "$SINK_LINE" | sed -E 's/.*[0-9]+\.[[:space:]]+(.+)[[:space:]]+\[vol.*/\1/' | sed 's/[[:space:]]*$//')

# Detect type by name pattern and show appropriate icon (Font Awesome)
case "$SINK_NAME" in
    *[Bb]luetooth*|*[Bb]luez*)
        printf "\uf293"  # Bluetooth
        ;;
    *HDMI*|*DisplayPort*|*GK107*)
        printf "\uf26c"  # TV/Display
        ;;
    *[Hh]eadphone*|*[Hh]eadset*)
        printf "\uf025"  # Headphones
        ;;
    *USB*|*DAC*)
        printf "\uf287"  # USB
        ;;
    *)
        printf "\uf028"  # Speaker
        ;;
esac
echo ""
