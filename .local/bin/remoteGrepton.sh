#! /bin/sh
read -s -p "Enter password: " password
nohup xfreerdp /u:grepton\\aszegedi /p:$password /f /smart-sizing:2560x1440 /v:192.168.50.11 /bpp:32 +fonts +clipboard -wallpaper /rfx /rfx-mode:video /gfx-h264 /audio-mode:1 /gdi:hw /scale:140 > ~/.nohupout/xfreerdp.out &
echo "\n"

