#!/usr/bin/env bash

set -euo pipefail

options=("Update" "Toggle Game Mode" "Toggle Scale" "Toggle Idle" "Toggle Tailscale" "Power Menu")

chosen=$(printf "%s\n" "${options[@]}" | fuzzel --dmenu --prompt="Menu: ") || exit 0

case "$chosen" in
    "Toggle Game Mode") "$HOME/.local/bin/toggle-gamemode.sh" ;;
    "Toggle Scale") "$HOME/.local/bin/toggle-scale.sh" ;;
    "Toggle Idle") "$HOME/.local/bin/toggle-idle.sh" ;;
    "Toggle Tailscale") "$HOME/.local/bin/toggle-tailscale.sh" ;;
    "Update") ghostty --class=com.local.update --wait-after-command=true -e "$HOME/.local/bin/update.sh" ;;
    "Power Menu") "$HOME/.local/bin/powermenu.sh" ;;
esac
