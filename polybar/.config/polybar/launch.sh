#!/usr/bin/env bash
# Launch polybar on every connected monitor. Mirrors waybar/restart.sh.
# Picks the per-host config if it exists, otherwise falls back to the shared
# config.ini. Kills any running polybar first so a reload is idempotent.

set -euo pipefail

HOST_CONFIG="$HOME/.config/polybar/hosts/$(hostname).ini"
SHARED_CONFIG="$HOME/.config/polybar/config.ini"

if [ -f "$HOST_CONFIG" ]; then
    CONFIG="$HOST_CONFIG"
else
    CONFIG="$SHARED_CONFIG"
fi

# Terminate existing instances.
killall -q polybar || true
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# One bar per connected monitor.
if type xrandr >/dev/null 2>&1; then
    for m in $(xrandr --query | awk '/ connected/ {print $1}'); do
        MONITOR=$m polybar --reload main --config="$CONFIG" >>/tmp/polybar.log 2>&1 &
        disown
    done
else
    polybar --reload main --config="$CONFIG" >>/tmp/polybar.log 2>&1 &
    disown
fi
