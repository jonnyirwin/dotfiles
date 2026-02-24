#!/bin/bash

exec >> /tmp/screenshot.log 2>&1
echo "=== $(date) ==="

sleep 0.2

dir=~/Pictures/Screenshots
mkdir -p "$dir"
filename="$dir/screenshot-$(date +%Y%m%d-%H%M%S).png"

echo "Starting slurp..."
region=$(slurp)
echo "Slurp returned: '$region'"

if [ -z "$region" ]; then
    echo "Slurp cancelled or failed"
    exit 1
fi

echo "Running grim..."
if grim -g "$region" "$filename"; then
    echo "Screenshot saved to $filename"
    xdg-open "$filename" &
    disown
else
    echo "Grim failed"
fi
