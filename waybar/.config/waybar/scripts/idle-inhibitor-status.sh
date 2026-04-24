#!/usr/bin/env bash
if [ -f /tmp/idle-inhibitor.pid ] && kill -0 "$(cat /tmp/idle-inhibitor.pid)" 2>/dev/null; then
    echo $''
else
    echo $''
fi
