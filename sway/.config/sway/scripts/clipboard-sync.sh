#!/bin/bash
# Sync clipboard to primary selection for middle-click paste
# This watches the clipboard and syncs it to primary selection

wl-paste -t text --watch wl-copy -p
