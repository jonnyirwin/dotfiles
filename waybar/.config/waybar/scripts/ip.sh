#!/bin/bash
# Outputs JSON for waybar custom/ip module.
# State file toggles between external and internal display.

STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/waybar-ip-mode"

if [[ "$1" == "toggle" ]]; then
    if [[ "$(cat "$STATE_FILE" 2>/dev/null)" == "internal" ]]; then
        echo "external" > "$STATE_FILE"
    else
        echo "internal" > "$STATE_FILE"
    fi
    pkill -SIGRTMIN+9 waybar
    exit 0
fi

mode="$(cat "$STATE_FILE" 2>/dev/null)"
mode="${mode:-external}"

if [[ "$mode" == "internal" ]]; then
    ip=$(ip -4 route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}')
    tooltip="Click for external IP"
    class="internal"
else
    ip=$(curl -sf --max-time 3 https://ifconfig.me)
    tooltip="Click for internal IP"
    class="external"
fi

ip="${ip:-unavailable}"
printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$ip" "$tooltip" "$class"
