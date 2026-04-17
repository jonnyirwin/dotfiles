# dotfiles

## Pre-requisites

[GNU Stow](https://www.gnu.org/software/stow/) should be installed.

## How to use

Clone this repository into `~/.dotfiles`.

```
cd ~/.dotfiles
stow fish sway waybar # etc.
```

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
