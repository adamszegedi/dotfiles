#!/usr/bin/env bash
# ------------------------------------------------------------
#  Lumo‑style monitor‑scale toggler for Hyprland
#  - Monitor name is configurable via the `monitor_name` variable
#  - Extracts monitor info, validates it, toggles the scale,
#    and restarts hyprpaper.
# ------------------------------------------------------------

set -euo pipefail               # fail fast on errors / undefined vars

# -----------------------------
# 0️⃣  Configuration
# -----------------------------
monitor_name="DP-2"             # <-- change this if you ever need a different monitor

# -----------------------------
# 1️⃣  Pull the monitor data (width, height, refreshRate, currentScale)
# -----------------------------
monitor_data=$(
    hyprctl monitors -j |
    jq -r "
        .[]
        | select(.name == \"${monitor_name}\")
        | [.width, .height, .refreshRate, .scale]
        | @csv
    "
)

# Split the CSV line into separate Bash variables
IFS=',' read -r width height refresh scale <<< "$monitor_data"

# -----------------------------
# 2️⃣  Show what we extracted (quick visual confirmation)
# -----------------------------
printf 'Extracted values for %s:\n  width   = %s\n  height  = %s\n  refresh = %s\n  scale   = %s\n' \
       "$monitor_name" "$width" "$height" "$refresh" "$scale"

# -----------------------------
# 3️⃣  Basic sanity checks
# -----------------------------
die() {
    printf '❌ %s\n' "$1" >&2
    exit 1
}

# a) Ensure none of the variables are empty
[[ -z $width ]]   && die "Width is empty – monitor ${monitor_name} probably wasn’t found."
[[ -z $height ]]  && die "Height is empty – monitor ${monitor_name} probably wasn’t found."
[[ -z $refresh ]] && die "Refresh rate is empty – monitor ${monitor_name} probably wasn’t found."
[[ -z $scale ]]   && die "Scale is empty – monitor ${monitor_name} probably wasn’t found."

# b) Validate numeric format
[[ $width  =~ ^[0-9]+$ ]]   || die "Width ($width) is not a valid integer."
[[ $height =~ ^[0-9]+$ ]]   || die "Height ($height) is not a valid integer."
[[ $refresh =~ ^[0-9]+(\.[0-9]+)?$ ]] || die "Refresh ($refresh) is not a valid number."
[[ $scale   =~ ^[0-9]+(\.[0-9]+)?$ ]] || die "Scale ($scale) is not a valid number."

# c) Scale must be non‑negative
awk -v s="$scale" 'BEGIN{exit !(s >= 0)}' || die "Scale ($scale) is negative."

# -----------------------------
# 4️⃣  Prepare the monitor specification string
# -----------------------------
# Hyprland expects an integer Hz value (e.g. 165hz, not 165.00000hz)
clean_refresh=${refresh%%.*}   # strip everything after the first dot

# -----------------------------
# 5️⃣  Decide which scale we want to set (toggle 1.00 ↔ 2.00)
# -----------------------------
case "$clean_refresh" in
    60)
        new_refreshRate="120"
        adaptive_sync="vrr,2"
        notif_msg="Setting refreshRate to ${new_refreshRate}hz."
        ;;
    120)
        new_refreshRate="60"
        adaptive_sync="vrr,0"
        notif_msg="Setting refreshRate to ${new_refreshRate}hz."
        ;;
    *)
        # If the current refreshRate is something else, just set to 60
        new_refreshRate="60"
        adaptive_sync="vrr,0"
        notif_msg="RefreshRate was ${clean_refresh}hz → setting to ${new_refreshRate}hz"
        ;;
esac

monitor_spec="${monitor_name},${width}x${height}@${new_refreshRate},0x0,${scale},${adaptive_sync}"

# -----------------------------
# 6️⃣  Apply the new monitor configuration
# -----------------------------
printf 'Running: hyprctl keyword monitor "%s"\n' "$monitor_spec"
hyprctl keyword monitor "$monitor_spec"

# Optional desktop notification (requires libnotify)
if command -v notify-send >/dev/null 2>&1; then
    notify-send -t 8000 "Hyprland monitor $monitor_name update" "$notif_msg"
fi

# -----------------------------
# 7️⃣  End of script
# -----------------------------
printf '✅ Done.\n'
