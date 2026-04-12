#!/usr/bin/env bash

options="Poweroff\nSuspend\nReboot\nLock"

chosen=$(printf "$options" | fuzzel --dmenu --prompt="System: ")

case "$chosen" in
    Poweroff) systemctl poweroff ;;
    Suspend)  systemctl suspend ;;
    Reboot)   systemctl reboot ;;
    Lock)     loginctl lock-session ;;
esac
