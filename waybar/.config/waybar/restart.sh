#!/bin/bash
pkill waybar
waybar -c ~/.config/waybar/hosts/$(hostname).json &
