#!/usr/bin/env bash

set -euo pipefail

file_path=$HOME/.config/hypr/hyprland.conf

if [[ ! -f "$file_path" ]]; then
    notify-send "Error: Configuration file not found at $file_path" >&2
    exit 1
fi

variable_name=DP_1_refresh_rate

sed -i "/$variable_name=60/ { s/60/120/; t }; /$variable_name=120/ s/120/60/" $file_path
hyprctl reload

new_rate=$(grep -m 1 $variable_name $file_path | cut -d'=' -f2)

notify-send -t 8000 "Refresh rate set to: ${new_rate}Hz"
