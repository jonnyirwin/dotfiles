#!/bin/bash
# Toggle region screen recording via ffmpeg (x11grab).
# First press: select a region, start recording.
# Second press: SIGINT the running recorder so it finalises the file.
# Deps: ffmpeg, slop, notify-send.

dir=~/Videos/Recordings
pidfile=/tmp/i3-recorder.pid
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

# slop emits: W H X Y (from the format string below)
read -r w h x y < <(slop -f "%w %h %x %y") || exit 1
[ -z "$w" ] && exit 1

filename="$dir/recording-$(date +%Y%m%d-%H%M%S).mp4"
display="${DISPLAY:-:0}"

ffmpeg -loglevel error -y \
    -video_size "${w}x${h}" \
    -framerate 30 \
    -f x11grab \
    -i "${display}+${x},${y}" \
    -c:v libx264 -preset veryfast -pix_fmt yuv420p \
    "$filename" &
echo $! > "$pidfile"

notify-send "Recording" "Started — press binding again to stop"
