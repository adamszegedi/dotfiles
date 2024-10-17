grim -o DP-3 /tmp/lock-main.png;
grim -o HDMI-A-1 /tmp/lock-side.png;
magick /tmp/lock-main.png -blur 0x10 /tmp/lock-main.png;
magick /tmp/lock-side.png -blur 0x10 /tmp/lock-side.png;
pos_x=780;
pos_y=464;
magick /tmp/lock-main.png ~/.config/swaylock/overlay.png -geometry +$pos_x+$pos_y -composite /tmp/lock-main.png;
swaylock -f -i DP-3:/tmp/lock-main.png -i HDMI-A-1:/tmp/lock-side.png
