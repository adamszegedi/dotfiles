#! /bin/sh
read -s -p "Enter password: " password
    nohup xfreerdp /u:grepton\\aszegedi /f /smart-sizing:2560x1440 /p:$password /v:192.168.50.11 /rfx /network:auto +clipboard -wallpaper /audio-mode:1 /scale:140 -grab-keyboard > ~/.nohupout/xfreerdp.out &
echo "\n"

