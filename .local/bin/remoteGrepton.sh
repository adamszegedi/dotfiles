#! /bin/sh
read -s -p "Enter password: " password
    nohup wlfreerdp /u:grepton\\aszegedi /f /smart-sizing:2560x1440 /p:$password /v:192.168.50.11 /bpp:32 +fonts +clipboard -wallpaper /rfx /rfx-mode:video /gfx-h264:avc444 +gfx-progressive /audio-mode:0 /gdi:hw /scale:140 -grab-keyboard > ~/.nohupout/xfreerdp.out &
echo "\n"

