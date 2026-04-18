#!/bin/bash
# Toggle region screen recording via wf-recorder.
# First press: select a region, start recording.
# Second press: SIGINT the running recorder so it finalises the file.
# Deps: wf-recorder, slurp, notify-send.

dir=~/Videos/Recordings
pidfile=/tmp/wf-recorder.pid
mkdir -p "$dir"

if [ -f "$pidfile" ] && kill -0 "$(cat "$pidfile")" 2>/dev/null; then
    pid=$(cat "$pidfile")
    kill -INT "$pid"
    for _ in 1 2 3 4 5; do
        kill -0 "$pid" 2>/dev/null || break
        sleep 0.2
    done
    rm -f "$pidfile"
    notify-send "Recording" "Stopped"
    exit 0
fi

region=$(slurp) || exit 1
[ -z "$region" ] && exit 1

filename="$dir/recording-$(date +%Y%m%d-%H%M%S).mp4"
wf-recorder -g "$region" -f "$filename" &
echo $! > "$pidfile"

notify-send "Recording" "Started — press binding again to stop"
