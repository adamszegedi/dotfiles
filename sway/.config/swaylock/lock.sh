grim -o DP-2 /tmp/lock-main.png;
grim -o HDMI-A-1 /tmp/lock-side.png;
magick /tmp/lock-main.png -blur 0x10 /tmp/lock-main.png;
magick /tmp/lock-side.png -blur 0x10 /tmp/lock-side.png;
swaylock -f -i DP-2:/tmp/lock-main.png -i HDMI-A-1:/tmp/lock-side.png
