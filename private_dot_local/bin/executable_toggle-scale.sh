#usr/bin/bash

set -euo pipefail               # fail fast on errors / undefined vars

hyprctl keyword monitor "DP-1,3840x2160@60,0x0,$(hyprctl monitors -j | jq '.[] | select(.name=="DP-1").scale | if . > 1.5 then 1 else 2 end'),vrr,3"

sleep 0.1s
pkill -RTMIN+3 waybar
