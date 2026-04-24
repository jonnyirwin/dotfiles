#!/usr/bin/env bash
# Toggles an idle inhibitor via logind (swayidle -w respects it).
# Stores PID in /tmp/idle-inhibitor.pid.
# Sends SIGRTMIN+8 to waybar to refresh the custom/idle-inhibitor module.

PIDFILE=/tmp/idle-inhibitor.pid

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    kill "$(cat "$PIDFILE")"
    rm -f "$PIDFILE"
else
    systemd-inhibit --what=idle --who="waybar-toggle" --why="Manual idle inhibitor" --mode=block \
        sleep infinity &
    echo $! > "$PIDFILE"
fi

pkill -RTMIN+10 waybar
