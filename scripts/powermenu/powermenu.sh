#!/usr/bin/env bash

menu_items='⇠ Logout\n󰜉 Reboot\n⏻ Shutdown'

selected=$(echo -e "$menu_items"|wofi --width 650 --height 210 --dmenu /dev/null | awk -F ' ' '{print $2 }')

echo "$selected"

case $selected in
    Logout )
        hyprctl dispatch exit;;
    Reboot )
        reboot;;
    Shutdown )
        poweroff;;
esac

