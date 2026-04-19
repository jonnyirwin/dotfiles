#!/usr/bin/env bash
# Toggle X11 idle/DPMS state in tandem with the polybar idle module's hook.
# Tracks state in /tmp so each call flips the real subsystem.

STATE_FILE=/tmp/polybar-idle-state

if [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "inhibited" ]; then
    # Currently inhibited → restore defaults.
    xset s default
    xset +dpms
    command -v xautolock >/dev/null && xautolock -enable || true
    rm -f "$STATE_FILE"
else
    # Currently active → inhibit.
    xset s off
    xset -dpms
    command -v xautolock >/dev/null && xautolock -disable || true
    echo "inhibited" > "$STATE_FILE"
fi
