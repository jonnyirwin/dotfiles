#!/usr/bin/env bash
# Deploy greetd configs to /etc/greetd/ — required because _greetd can't traverse /home/jonny
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sudo cp "$SCRIPT_DIR/etc/greetd/config.toml" /etc/greetd/config.toml
sudo cp "$SCRIPT_DIR/etc/greetd/gtkgreet.css" /etc/greetd/gtkgreet.css
sudo install -m 755 "$SCRIPT_DIR/etc/greetd/greeter-start" /etc/greetd/greeter-start
sudo cp "$SCRIPT_DIR/etc/greetd/sway-config" /etc/greetd/sway-config
echo "Deployed. Restart greetd with: sudo systemctl restart greetd"
