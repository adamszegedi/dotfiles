#!/usr/bin/env bash

set -euo pipefail

options=("Poweroff" "Suspend" "Reboot" "Lock")

chosen=$(printf "%s\n" "${options[@]}" | fuzzel --dmenu --prompt="System: ")

case "$chosen" in
    Poweroff) systemctl poweroff ;;
    Suspend)  systemctl suspend ;;
    Reboot)   systemctl reboot ;;
    Lock)     loginctl lock-session ;;
esac
