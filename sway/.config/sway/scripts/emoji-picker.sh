#!/bin/bash
# Emoji picker via rofi. Prefers rofimoji (pipx install rofimoji); falls
# back to the rofi-emoji plugin (apt install rofi-emoji).

# pipx installs to ~/.local/bin which sway's exec PATH doesn't include.
export PATH="$HOME/.local/bin:$PATH"

if command -v rofimoji &>/dev/null; then
    # `type` sends keystrokes to the focused window via wtype on Wayland;
    # `copy` stashes the emoji in the clipboard as a fallback.
    exec rofimoji --selector rofi --action type copy
fi

exec rofi -show emoji
