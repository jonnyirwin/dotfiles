#!/usr/bin/env bash
# Single knob for font sizes across kitty, waybar, polybar, mako, and dunst.
# Rewrites the committed config files (safe with stow) and reloads running
# services. The current multiplier persists in ~/.config/font-scale.
#
# Usage:
#   ui-font.sh            # print current scale
#   ui-font.sh up         # +0.1
#   ui-font.sh down       # -0.1
#   ui-font.sh reset      # 1.0
#   ui-font.sh set 1.25   # absolute

set -euo pipefail

SCALE_FILE="$HOME/.config/font-scale"
DOTFILES="$HOME/.dotfiles"

# Baselines at scale 1.0 — edit these to shift the neutral point.
KITTY_BASE=16
WAYBAR_BASE=16
POLYBAR_F0=12      # Dank Mono
POLYBAR_F1=14      # Symbols Nerd Font Mono
POLYBAR_F2=10      # Noto Color Emoji (uses `scale=`, not `size=`)
MAKO_BASE=13
DUNST_BASE=13

STEP=0.1
MIN=0.6
MAX=2.0

current() {
    [ -f "$SCALE_FILE" ] && cat "$SCALE_FILE" || echo "1.0"
}

clamp() {
    awk -v s="$1" -v lo="$MIN" -v hi="$MAX" 'BEGIN {
        if (s < lo) s = lo;
        if (s > hi) s = hi;
        printf "%.2f", s;
    }'
}

apply() {
    local scale
    scale=$(clamp "$1")
    echo "$scale" > "$SCALE_FILE"

    local kitty_size waybar_size p0 p1 p2 mako_size dunst_size
    kitty_size=$(awk -v b="$KITTY_BASE"  -v s="$scale" 'BEGIN { printf "%.1f", b*s }')
    waybar_size=$(awk -v b="$WAYBAR_BASE" -v s="$scale" 'BEGIN { printf "%d", int(b*s + 0.5) }')
    p0=$(awk -v b="$POLYBAR_F0" -v s="$scale" 'BEGIN { printf "%d", int(b*s + 0.5) }')
    p1=$(awk -v b="$POLYBAR_F1" -v s="$scale" 'BEGIN { printf "%d", int(b*s + 0.5) }')
    p2=$(awk -v b="$POLYBAR_F2" -v s="$scale" 'BEGIN { printf "%d", int(b*s + 0.5) }')
    mako_size=$(awk -v b="$MAKO_BASE"  -v s="$scale" 'BEGIN { printf "%d", int(b*s + 0.5) }')
    dunst_size=$(awk -v b="$DUNST_BASE" -v s="$scale" 'BEGIN { printf "%d", int(b*s + 0.5) }')

    # kitty.conf — "font_size        <n>"
    sed -i -E "s/^font_size([[:space:]]+)[0-9.]+/font_size\1${kitty_size}/" \
        "$DOTFILES/kitty/.config/kitty/kitty.conf"

    # waybar style.css — "  font-size: Npx;"
    sed -i -E "s/^  font-size: [0-9]+px;/  font-size: ${waybar_size}px;/" \
        "$DOTFILES/waybar/.config/waybar/style.css"

    # polybar config.ini — font-0/1 use size=, font-2 uses scale=
    sed -i -E "s/^(font-0 = .*:size=)[0-9]+(.*)$/\1${p0}\2/" \
        "$DOTFILES/polybar/.config/polybar/config.ini"
    sed -i -E "s/^(font-1 = .*:size=)[0-9]+(.*)$/\1${p1}\2/" \
        "$DOTFILES/polybar/.config/polybar/config.ini"
    sed -i -E "s/^(font-2 = .*:scale=)[0-9]+(.*)$/\1${p2}\2/" \
        "$DOTFILES/polybar/.config/polybar/config.ini"

    # mako — "font=SF Mono 13"
    sed -i -E "s/^font=(.*) [0-9]+$/font=\1 ${mako_size}/" \
        "$DOTFILES/mako/.config/mako/config"

    # dunst — 'font = "SF Mono 13"'
    sed -i -E "s/^font = \"(.*) [0-9]+\"$/font = \"\1 ${dunst_size}\"/" \
        "$DOTFILES/dunst/.config/dunst/dunstrc"

    reload_services "$kitty_size"

    echo "font scale: $scale  (kitty $kitty_size, waybar ${waybar_size}px, polybar $p0/$p1/$p2, mako $mako_size, dunst $dunst_size)"
}

reload_services() {
    local kitty_size="$1"

    command -v kitty >/dev/null 2>&1 && \
        kitty @ --to unix:@kitty set-font-size --all "$kitty_size" >/dev/null 2>&1 || true
    pkill -USR1 -x kitty 2>/dev/null || true

    pkill -SIGUSR2 waybar 2>/dev/null || true

    if pgrep -x polybar >/dev/null 2>&1; then
        if [ -x "$HOME/.config/polybar/launch.sh" ]; then
            "$HOME/.config/polybar/launch.sh" >/dev/null 2>&1 &
        else
            command -v polybar-msg >/dev/null 2>&1 && polybar-msg cmd restart >/dev/null 2>&1 || true
        fi
    fi

    command -v makoctl  >/dev/null 2>&1 && makoctl reload 2>/dev/null || true
    command -v dunstctl >/dev/null 2>&1 && dunstctl reload 2>/dev/null || true
}

cmd=${1:-get}
case "$cmd" in
    up)    apply "$(awk -v s="$(current)" -v d="$STEP" 'BEGIN { printf "%.2f", s + d }')" ;;
    down)  apply "$(awk -v s="$(current)" -v d="$STEP" 'BEGIN { printf "%.2f", s - d }')" ;;
    reset) apply 1.0 ;;
    set)   [ -z "${2:-}" ] && { echo "usage: $(basename "$0") set <scale>" >&2; exit 2; }; apply "$2" ;;
    get)   current ;;
    *)     echo "usage: $(basename "$0") up|down|reset|set <scale>|get" >&2; exit 2 ;;
esac
