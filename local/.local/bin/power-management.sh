#!/bin/bash

# Define the menu options and use tofi to get the user's choice
CHOICE=$(printf "reboot\nshutdown\nsuspend" | tofi --prompt-text="Power Option:" --min-input-width=0 --anchor=top-left --width="25%" --margin-left="40%")

# Check the user's choice and execute the corresponding systemctl command
case "$CHOICE" in
    "reboot")
        echo "Executing: systemctl reboot"
        systemctl reboot # Uncomment this line to enable the actual command
        ;;
    "shutdown")
        echo "Executing: systemctl poweroff"
        systemctl poweroff # Uncomment this line to enable the actual command
        ;;
    "suspend")
        echo "Executing: systemctl suspend"
        systemctl suspend # Uncomment this line to enable the actual command
        ;;
    *)
        echo "Canceled or invalid option chosen: $CHOICE"
        ;;
esac
