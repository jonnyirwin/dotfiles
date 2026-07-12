#!/usr/bin/env bash
# Installs files that can't be managed by stow (privileged paths, etc.)
# Run after stowing packages.

set -euo pipefail

# OpenSCAD editor color schemes (system path only — 2021.01 ignores ~/.local/share)
sudo cp ~/.local/share/OpenSCAD/color-schemes/editor/catppuccin-mocha.json \
    /usr/share/openscad/color-schemes/editor/catppuccin-mocha.json
