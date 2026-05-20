#!/usr/bin/env bash

# Catppuccin Mocha palette
RESET='\033[0m'
BOLD='\033[1m'
# Accent: read hex from ~/.config/catppuccin/accent.hex; convert to RGB escape.
__accent_hex="$(cat "${XDG_CONFIG_HOME:-$HOME/.config}/catppuccin/accent.hex" 2>/dev/null || echo cba6f7)"
__accent_hex="${__accent_hex//[^0-9a-fA-F]/}"
ACCENT="$(printf '\033[38;2;%d;%d;%dm' "$((16#${__accent_hex:0:2}))" "$((16#${__accent_hex:2:2}))" "$((16#${__accent_hex:4:2}))")"
BLUE='\033[38;2;137;180;250m'
LAVENDER='\033[38;2;180;190;254m'
SUBTEXT='\033[38;2;166;173;200m'
TEXT='\033[38;2;205;214;244m'
SURFACE='\033[38;2;88;91;112m'

key()    { printf "  ${LAVENDER}${BOLD}%-22s${RESET}" "$1"; }
desc()   { printf "${TEXT}%s${RESET}\n" "$1"; }
sep()    { printf "${SURFACE}  %-40s${RESET}\n" "$(printf '─%.0s' {1..44})"; }
header() { printf "\n${ACCENT}${BOLD}  %s${RESET}\n" "$1"; sep; }

{
printf "${BLUE}${BOLD}  Sway Keybindings${RESET}  ${SUBTEXT}(Mod = Super)${RESET}\n"

header "Basics"
key "Mod+Return"      ; desc "Terminal"
key "Mod+Shift+Q"     ; desc "Kill window"
key "Mod+D"           ; desc "App launcher"
key "Mod+Tab"         ; desc "Window switcher"
key "Mod+C"           ; desc "Clipboard history"
key "Mod+;"           ; desc "Voice input toggle"
key "Mod+Shift+V"     ; desc "Paste PRIMARY selection"
key "Mod+Shift+C"     ; desc "Reload config"
key "Mod+Shift+E"     ; desc "Power menu"
key "Mod+Shift+X"     ; desc "Lock screen"
key "Mod+I"           ; desc "Idle inhibitor toggle"
key "Mod+O"           ; desc "Toggle waybar"

header "Apps & Scripts"
key "Mod+Shift+D"     ; desc "Display manager (resolution / rotate / on/off)"
key "Mod+P"           ; desc "Pomodoro timer"
key "Mod+="           ; desc "Font size scaling"
key "Mod+."           ; desc "Emoji picker"
key "Mod+Shift+O"     ; desc "OCR region → clipboard"
key "Mod+Shift+P"     ; desc "Color picker → clipboard"
key "Mod+S"           ; desc "Screenshot region → clipboard"
key "Mod+Shift+S"     ; desc "Screenshot (flameshot + annotations)"
key "Mod+Shift+R"     ; desc "Toggle screen recording"

header "Scratchpads"
key "Mod+M"           ; desc "Pulsemixer (audio mixer)"
key "Mod+T"           ; desc "btop (system monitor)"
key "Mod+N"           ; desc "Scratch notes"
key "Mod+Y"           ; desc "Yazi (file manager)"
key "Mod+?"           ; desc "This cheatsheet"
key "Mod+-"           ; desc "Cycle scratchpad windows"
key "Mod+Shift+-"     ; desc "Send window to scratchpad"

header "Audio"
key "Mod+Alt+K / J"   ; desc "Volume up / down"
key "Mod+Alt+M"       ; desc "Mute toggle"
key "Mod+Alt+."       ; desc "Next track"
key "Mod+Alt+,"       ; desc "Previous track"
key "Mod+Alt+Space"   ; desc "Play / pause"

header "Brightness"
key "Mod+Alt+L / H"   ; desc "Brightness up / down"

header "Focus"
key "Mod+H/J/K/L"     ; desc "Focus left / down / up / right"
key "Mod+Arrows"      ; desc "Focus (arrow keys)"
key "Mod+A"           ; desc "Focus parent container"
key "Mod+Ctrl+A"      ; desc "Focus child container"
key "Mod+Space"       ; desc "Toggle focus: tiling ↔ floating"

header "Move Windows"
key "Mod+Shift+H/J/K/L" ; desc "Move window"
key "Mod+Ctrl+Arrows" ; desc "Move workspace to output"

header "Workspaces"
key "Mod+1–0"         ; desc "Switch to workspace"
key "Mod+Shift+1–0"   ; desc "Move window to workspace"
key "Mod+\`"           ; desc "Back and forth"

header "Layout"
key "Mod+F"           ; desc "Fullscreen"
key "Mod+Shift+Space" ; desc "Toggle floating"
key "Mod+B"           ; desc "Split horizontal"
key "Mod+V"           ; desc "Split vertical"
key "Mod+S"           ; desc "Stacking layout"
key "Mod+E"           ; desc "Toggle split"
key "Mod+R"           ; desc "Resize mode  (then H/J/K/L or arrows)"

printf "\n${SUBTEXT}  Q to close${RESET}\n\n"
} | less -R --quit-if-one-screen
