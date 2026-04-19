# dotfiles

## Pre-requisites

[GNU Stow](https://www.gnu.org/software/stow/) should be installed.

## How to use

Clone this repository into `~/.dotfiles`.

```
cd ~/.dotfiles
stow fish sway waybar        # Wayland machines
stow fish i3 polybar dunst   # X11 machines
```

## Window manager (Sway / i3)

Sway (Wayland) and i3 (X11) share the same keybindings and UX. Swap the compositor, the muscle memory carries over. `$mod` is the Super / Windows key.

### Launching & session

| Shortcut | Action |
| --- | --- |
| `$mod+Return` | Terminal (kitty) |
| `$mod+d` | App launcher (rofi drun) |
| `$mod+Tab` | Window switcher (rofi) |
| `$mod+c` | Clipboard history (rofi) |
| `$mod+p` | Pomodoro menu |
| `$mod+semicolon` | Voice input toggle (whisper.cpp) |
| `$mod+Shift+q` | Kill focused window |
| `$mod+Shift+c` | Reload config |
| `$mod+Shift+e` | Power menu (lock / logout / suspend / reboot / shutdown) |
| `$mod+Shift+d` | Display configuration (sway: resolution switcher, i3: arandr) |
| `$mod+Shift+v` | Paste primary selection into focused window |

### Focus & movement

| Shortcut | Action |
| --- | --- |
| `$mod+h`/`j`/`k`/`l` | Focus left / down / up / right |
| `$mod+Arrow` | Same, via arrow keys |
| `$mod+Shift+h`/`j`/`k`/`l` | Move window within container |
| `$mod+Shift+Arrow` | Same, via arrow keys |
| `$mod+Ctrl+Arrow` | Move current workspace to adjacent output |
| `$mod+a` | Focus parent container |
| `$mod+space` | Swap focus between tiling and floating area |

### Workspaces

| Shortcut | Action |NK_AUDIO]
| --- | --- |
| `$mod+1` … `$mod+0` | Switch to workspace 1–10 |
| `$mod+Shift+1` … `$mod+Shift+0` | Move focused container to workspace 1–10 |
| `$mod+grave` (`` ` ``) | Jump back to previous workspace |

`workspace_auto_back_and_forth` is enabled: pressing the current workspace's number key a second time bounces you back to where you came from.

### Layout

| Shortcut | Action |
| --- | --- |
| `$mod+b` | Split horizontal |
| `$mod+v` | Split vertical |
| `$mod+s` | Stacking layout |
| `$mod+w` | Tabbed layout |
| `$mod+e` | Toggle split layout |
| `$mod+f` | Fullscreen toggle |
| `$mod+Shift+space` | Toggle tiling / floating for focused window |

### Scratchpad

| Shortcut | Action |
| --- | --- |
| `$mod+Shift+minus` | Send focused window to scratchpad |
| `$mod+minus` | Show / cycle scratchpad windows, then hide |

### Resize mode

`$mod+r` enters resize mode; `Escape` or `Return` exits.

| Key | Action |
| --- | --- |
| `h`/`j`/`k`/`l` or Arrows | Shrink width / grow height / shrink height / grow width |

### Screenshots, capture & pickers

| Shortcut | Action |
| --- | --- |
| `$mod+Shift+s` | Region screenshot with annotation (flameshot) |
| `$mod+period` | Emoji picker — types or copies (rofimoji) |
| `$mod+Shift+o` | OCR selected region, copy text to clipboard (tesseract) |
| `$mod+Shift+p` | Pick a colour under the cursor → `#RRGGBB` in clipboard |
| `$mod+Shift+r` | Toggle region screen recording (Wayland: wf-recorder, X11: ffmpeg) |

### Media keys

| Key | Action |
| --- | --- |
| `XF86AudioRaiseVolume` / `XF86AudioLowerVolume` | Adjust default sink volume (`pactl`) |
| `XF86AudioMute` | Mute / unmute default sink |
| `XF86AudioMicMute` | Mute / unmute default source |

### Rofi menus

All menu-driven interactions go through rofi so they share a single theme and keyboard ergonomics.

- **App launcher** (`$mod+d`) — `rofi -show drun -show-icons` lists desktop entries. Type to filter, Enter to launch.
- **Window switcher** (`$mod+Tab`) — walks the sway/i3 tree with `jq`, lists every window as `<app>\t<title>`, focuses the chosen one (`swaymsg` / `i3-msg [con_id=…] focus`).
- **Clipboard history** (`$mod+c`) — `cliphist` on Wayland (populated by `wl-paste --watch cliphist store`) or `greenclip` on X11, both rendered through rofi. Enter pastes from the clipboard.
- **Power menu** (`$mod+Shift+e`) — rofi picker for Lock / Logout / Suspend / Reboot / Shutdown. Uses `swaylock`/`i3lock` for Lock, `swaymsg exit`/`i3-msg exit` for Logout, `systemctl` for the rest.
- **Pomodoro menu** (`$mod+p`) — start / pause / resume / reset / configure the pomodoro. Durations live in `waybar/scripts/pomodoro.conf`; the same script powers the waybar/polybar status module and the menu, so state is consistent.
- **Emoji picker** (`$mod+period`) — rofimoji shown via rofi. Default action: type the emoji into the focused window (via `wtype`/`xdotool`); fallback: copy to clipboard. Falls back to `rofi -show emoji` (rofi-emoji plugin) if rofimoji isn't installed.
- **Display switcher** (`$mod+Shift+d`, sway only) — rofi menu over `swaymsg -t get_outputs` offering per-output mode selection, enable/disable, and left/right reordering. Changes are persisted to `~/.config/sway/config.d/display-settings.conf` so they survive reboots. On i3 this key launches `arandr` instead.

### Auto-tiling

[`autotiling`](https://github.com/nwg-piotr/autotiling) watches focus events and flips the container split direction based on the focused window's proportions: wider than tall → horizontal, taller than wide → vertical. You get a vim-paned layout without ever pressing `$mod+b` / `$mod+v` manually.

### Smart gaps & smart borders

- `gaps inner 5` with `smart_gaps on`: 5 px gaps appear only when there's more than one window on the workspace — single-window workspaces render edge-to-edge.
- `default_border none` with `smart_borders on`: window borders are off globally so kitty/terminal tiles sit flush.

### Wallpaper rotation

`random-wallpaper.sh` picks a random image from `~/Pictures/Wallpapers` (jpg/png/webp/jxl) and sets it via `swaybg` or `feh`. Triggered by `exec_always`, so `$mod+Shift+c` reshuffles.

### Idle / lock

Sway uses `swayidle` to dim and lock via `swaylock` after 5 min idle and on sleep. i3 uses `xss-lock` (sleep/suspend lock) plus `xautolock` (idle timer). Both converge on the same `~/Pictures` lockscreen image.

## Installing dependencies

Install the subset that matches the compositor you actually run on each machine. `kitty`, `fish`, and common CLI tooling are assumed to be installed separately; the lists below cover only the window-manager stack.

### Ubuntu (Wayland — sway, 24.04+)

```bash
sudo apt install sway swaybg swayidle swaylock waybar \
  wl-clipboard cliphist grim slurp wf-recorder wtype \
  mako-notifier jq autotiling \
  rofi flameshot tesseract-ocr imagemagick \
  brightnessctl playerctl pavucontrol \
  network-manager-gnome xdg-desktop-portal-wlr
pipx install rofimoji
```

On 22.04 `cliphist` and `wtype` aren't packaged. Install them as:

```bash
# cliphist via Go
sudo apt install golang-go
go install go.senan.xyz/cliphist@latest    # lands in ~/go/bin

# wtype from source (or pin the PPA)
sudo apt install build-essential meson libwayland-dev libxkbcommon-dev
git clone https://github.com/atx/wtype.git /tmp/wtype
cd /tmp/wtype && meson build && ninja -C build && sudo ninja -C build install
```

### Ubuntu (X11 — i3, 22.04+)

i3 ≥ 4.22 is required for `include`. Ubuntu 22.04 ships 4.20, so pull i3 from the sur5r PPA (upstream's official repo):

```bash
/usr/lib/apt/apt-helper download-file \
  https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb \
  /tmp/keyring.deb
sudo apt install /tmp/keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -cs) universe" \
  | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update && sudo apt install i3
```

Then the remaining deps:

```bash
sudo apt install polybar dex dunst picom i3lock xss-lock xautolock \
  feh rofi flameshot maim slop xclip xdotool \
  tesseract-ocr imagemagick ffmpeg arandr \
  brightnessctl playerctl pavucontrol \
  network-manager-gnome x11-xkb-utils jq autotiling
pipx install rofimoji

# greenclip — only on GitHub releases
curl -L https://github.com/erebe/greenclip/releases/latest/download/greenclip \
  -o ~/.local/bin/greenclip && chmod +x ~/.local/bin/greenclip

# xcolor — cargo
sudo apt install cargo
cargo install xcolor
```

### Debian (Wayland — sway, bookworm/12+)

```bash
sudo apt install sway swaybg swayidle swaylock waybar \
  wl-clipboard grim slurp wf-recorder wtype \
  mako-notifier jq rofi flameshot \
  tesseract-ocr imagemagick brightnessctl playerctl pavucontrol \
  network-manager-gnome xdg-desktop-portal-wlr \
  pipx golang-go
pipx install rofimoji autotiling

# cliphist isn't in Debian main; build via Go
go install go.senan.xyz/cliphist@latest    # lands in ~/go/bin
```

Ensure `~/go/bin` and `~/.local/bin` are on `PATH` (fish handles this via `fish_add_path` in the shared profile).

### Fedora (Wayland — sway, 39+)

Most of what you need is packaged. `@base-x` is not required under pure Wayland.

```bash
sudo dnf install sway swaybg swayidle swaylock waybar \
  wl-clipboard cliphist grim slurp wf-recorder wtype \
  mako jq rofi-wayland flameshot \
  tesseract ImageMagick brightnessctl playerctl pavucontrol \
  NetworkManager-gnome xdg-desktop-portal-wlr \
  pipx autotiling
pipx install rofimoji
```

Fedora ships a separate `rofi-wayland` package that has the Wayland backend compiled in — prefer it over the X11 `rofi` package on sway.

### Notes

- `rofimoji` is always installed via `pipx` because distro packaging is inconsistent; `pipx install rofimoji` lands it in `~/.local/bin`.
- `autotiling` is in the Ubuntu/Debian/Fedora repos, but `pipx install autotiling` is the portable fallback if the version in your repo is old.
- The `kitty` terminal, `fish` shell, `rofi` theming, `starship` prompt, fonts (`Dank Mono`, `Symbols Nerd Font Mono`), and `tmux` are configured via their respective stow packages and aren't listed above; install them if you want the full visual set.

## Per-host configuration

Machine-dependent config (displays, input devices, battery/backlight widgets, etc.) is kept out of the shared config and pulled in via hostname-scoped include files. To add a new machine, create a file named after its hostname in each relevant `hosts/` directory.

### Sway

`sway/.config/sway/config` ends with:

```
include ~/.config/sway/hosts/$(hostname).conf
```

Sway's `include` uses `wordexp(3)` via `/bin/sh`, so command substitution works regardless of login shell.

Per-host file: `sway/.config/sway/hosts/<hostname>.conf` — put `output`, `input`, and any other host-specific directives here.

### Fish

`fish/.config/fish/conf.d/host.fish` sources the per-host file if present:

```fish
set -l host_conf ~/.config/fish/hosts/(hostname).fish
test -f $host_conf; and source $host_conf
```

Per-host file: `fish/.config/fish/hosts/<hostname>.fish`.

### Waybar

Waybar uses JSON and doesn't support shell expansion, so the host file is selected at launch via `-c`:

- `waybar/.config/waybar/hosts/<hostname>.json` is the per-host config. It uses waybar's `"include"` key to pull in the shared `../config` base, then overrides keys like `modules-right` to reflect the machine's hardware (e.g. omit `battery`/`backlight` on a desktop).
- `restart.sh` and sway's `swaybar_command` both launch waybar with `-c ~/.config/waybar/hosts/$(hostname).json`.

To onboard a new host, copy an existing `hosts/<host>.json` and adjust the module list.

### i3 (X11)

i3 mirrors the sway layout for machines running Xorg:

- `i3/.config/i3/config` — main config, structurally identical to sway's.
- `i3/.config/i3/config.d/*.conf` — colours, gaps, borders, bar fragments (same `10-catppuccin-mocha`, `20-colors`, `border`, `gaps`, `90-bar` split as sway).
- `i3/.config/i3/hosts/<hostname>.conf` — per-host includes via `include ~/.config/i3/hosts/$(hostname).conf`. Requires i3 ≥ 4.22; see the Ubuntu 22.04 install notes for the sur5r PPA.
- `i3/.config/i3/scripts/` — X11 ports of the sway scripts: `power-menu.sh` (i3lock + i3-msg exit), `random-wallpaper.sh` (feh), `emoji-picker.sh` (rofimoji → xdotool), `ocr.sh` (maim + slop + xclip), `color-picker.sh` (xcolor, falling back to maim+imagemagick), `record-toggle.sh` (ffmpeg x11grab + slop), `window-switcher.sh` (i3-msg).

Display configuration is delegated to `arandr` on X11 (`$mod+Shift+d`) rather than the sway-only `resolution-switcher.sh`.

### Polybar (X11)

Polybar is the waybar analogue used on i3:

- `polybar/.config/polybar/config.ini` — shared base (catppuccin mocha palette, `[bar/main]` definition, all modules).
- `polybar/.config/polybar/hosts/<hostname>.ini` — optional per-host override file. If missing, `launch.sh` falls back to the shared config.
- `polybar/.config/polybar/launch.sh` — picks host file vs shared config, starts one bar per `xrandr`-connected monitor.
- `polybar/.config/polybar/scripts/pomodoro-wrapper.sh` — shell wrapper that turns the waybar pomodoro JSON into plain text for polybar.
- `polybar/.config/polybar/scripts/idle-toggle.sh` — flips DPMS/screensaver/xautolock when the idle module is clicked.

Visual parity with waybar is close but not pixel-identical: polybar doesn't support per-module `border-radius`, so status segments are coloured rectangles rather than capsule pills. Font, palette and spacing all match.
