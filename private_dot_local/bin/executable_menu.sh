#!/usr/bin/env bash

set -euo pipefail

options=("Toggle Game Mode" "Toggle Scale" "Toggle Idle" "Toggle Tailscale" "Power Menu")

chosen=$(printf "%s\n" "${options[@]}" | fuzzel --dmenu --prompt="Menu: ") || exit 0

case "$chosen" in
    "Toggle Game Mode") "$HOME/.local/bin/toggle-gamemode.sh" ;;
    "Toggle Scale") "$HOME/.local/bin/toggle-scale.sh" ;;
    "Toggle Idle") "$HOME/.local/bin/toggle-idle.sh" ;;
    "Toggle Tailscale") "$HOME/.local/bin/toggle-tailscale.sh" ;;
    "Power Menu") "$HOME/.local/bin/powermenu.sh" ;;
esac
