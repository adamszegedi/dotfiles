{ lib, pkgs, ... }:
let
    modifier = "Mod4";
in
{
    wayland.windowManager.sway = {
            enable = true;
            checkConfig = false;
            config = {
                gaps = {
                    inner = 6;
                    smartGaps = true;
                    smartBorders = "on";
                };

                window = {
                    border = 3;
                    titlebar = false;
                };

                floating = {
                    border = 3;
                };

                bars = [
                    {
                        command = "waybar";
                    }
                ];

                input = {
                    "1133:16522:Logitech_MX_Keys" = {
                        xkb_layout = "us";
                        xkb_variant = "altgr-intl";
                    };
                };

                modifier = modifier;
                
                left = "h";

                down = "j";

                up = "k";
                
                right = "l";

                output = {  
                    HDMI-A-1 = {
                        pos = "0,0";
                        mode = "2560x1440@59.951Hz";
                    };

                    DP-3 = {
                        pos = "2560,0";
                        mode = "2560x1440@59.951Hz";
                    };
                };

                keybindings = lib.mkOptionDefault {
                  "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
                  "${modifier}+Shift+q" = "kill";
                  "${modifier}+d" = "exec ${pkgs.tofi}/bin/tofi-drun | xargs swaymsg exec --";
                  "${modifier}+Shift+d" = "exec ${pkgs.tofi}/bin/tofi-run | xargs swaymsg exec --";
                  "Alt+Print" = "exec grim -g \"$(slurp)\" -t png - | wl-copy -t image/png";
                  "Control+Print" = "exec grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy";
                  "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
                  "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
                  "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
                  "XF86AudioPlay" = "exec playerctl play-pause";
                  "XF86AudioNext" = "exec playerctl next";
                  "XF86AudioPrev" = "exec playerctl previous";
                };
            };
            
            extraConfig = ''
            include autostart
            include rules
            output * background /home/aszegedi/Pictures/wallpaper/sand_tree_night.jpeg fill
            '';
   };
}
