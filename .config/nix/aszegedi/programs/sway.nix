{ lib, pkgs, ... }:
let
    modifier = "Mod4";
    monitors = import ../../monitors.nix;  
    blue = "#7aa2f7";
    fg = "#C0CAF5";
    fg_dark = "#a9b1d6";
    bg = "#1A1B26";
    cyan = "#7dcfff";
    terminal_black = "#414868";
    yellow = "#e0af68";
in
{
    home.file = {
      "wallpaper" = {
      source = ../images/wallpaper.jpg;
      target = ".config/sway/wallpaper.jpg";
      };
    };
    wayland.windowManager.sway = {
            enable = true;
            checkConfig = false;
            config = {
                colors = {
                    focused = {
                      background = terminal_black;
                      border = blue;
                      childBorder = blue;
                      indicator = cyan;
                      text = fg;
                    };        

                    unfocused = {
                      background = bg;
                      border = terminal_black;
                      childBorder = terminal_black;
                      indicator = cyan;
                      text = fg_dark;
                    };        

                    focusedInactive = {
                      background = terminal_black;
                      border = blue;
                      childBorder = blue;
                      indicator = cyan;
                      text = fg;
                    };        

                    urgent = {
                      background = yellow;
                      border = yellow;
                      childBorder = yellow;
                      indicator = cyan;
                      text = bg;
                    };        
                };
                gaps = {
                    inner = 6;
                    smartGaps = true;
                    smartBorders = "on";
                };

                fonts = {
                    names = [ "DroidSansMono" ];
                    style = "Bold Semi-Condensed";
                    size = 14.0;
                };

                window = {
                    border = 3;
                    titlebar = false;
                    commands = [
                        { command = "floating enable"; criteria = {app_id="imv";};}
                        { command = "inhibit_idle fullscreen"; criteria = {app_id="^.*";};}
                        { command = "inhibit_idle fullscreen"; criteria = {class="^.*";};}
                        { command = "floating enable, sticky enable, move position cursor, move down 35"; criteria = {app_id="pavucontrol";};}
                        { command = "move to workspace 3, focus"; criteria = {title="mc";};}
                        { command = "move to workspace 5"; criteria = {app_id="WebCord";};}
                        { command = "move to workspace 5"; criteria = {app_id="chrome-cifhbcnohmdccbgoicgdjpfamggdegmo-Default";};}
                        { command = "move to workspace 7"; criteria = {class="steam";};}
                        { command = "move to workspace 8"; criteria = {app_id="firefox"; title="YouTube";};}
                        { command = "move to workspace 8, focus"; criteria = {app_id="org.jellyfin.jellyfinmediaplayer";};}
                        { command = "move to workspace 8, focus"; criteria = {app_id="mpv";};}
                        { command = "move to workspace 9, focus"; criteria = {app_id="org.remmina.Remmina";};}
                    ];
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
                    "${monitors.side}" = {
                        pos = "0,0";
                        mode = "2560x1440@59.951Hz";
                        bg = "~/.config/sway/wallpaper.jpg fill";
                    };

                    "${monitors.main}" = {
                        pos = "2560,0";
                        mode = "2560x1440@59.951Hz";
                        bg = "~/.config/sway/wallpaper.jpg fill";
                    };
                };

                keybindings = lib.mkOptionDefault {
                  "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
                  "${modifier}+Shift+q" = "kill";
                  "${modifier}+d" = "exec ${pkgs.tofi}/bin/tofi-drun | xargs swaymsg exec --";
                  "${modifier}+Shift+d" = "exec ${pkgs.tofi}/bin/tofi-run | xargs swaymsg exec --";
                  "Alt+Print" = "exec grim -g \"$(slurp)\" -t png - | wl-copy -t image/png";
                  "Alt+Control+l" = "exec ~/.config/swaylock/lock.sh";
                  "Control+Print" = "exec grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy";
                  "Alt+Control+Print" = "exec grim -g \"$(slurp -p)\" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4 | wl-copy";
                  "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
                  "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
                  "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
                  "XF86AudioPlay" = "exec playerctl play-pause";
                  "XF86AudioNext" = "exec playerctl next";
                  "XF86AudioPrev" = "exec playerctl previous";
                };

                startup = [
                    { command = "swaymsg \"workspace 1; exec alacritty;\"";}
                    { command = "swaymsg \"workspace 8;\"";}
                    { command = "swaymsg \"workspace 2; exec flatpak run org.mozilla.firefox\"";}
                ];

                seat = {
                    "*" = {
                        xcursor_theme = "Bibata-Modern-Ice 36";
                    };
                };

                workspaceOutputAssign = [
                    { workspace = "1"; output = "${monitors.main}";}
                    { workspace = "2"; output = "${monitors.main}";}
                    { workspace = "3"; output = "${monitors.main}";}
                    { workspace = "4"; output = "${monitors.main}";}
                    { workspace = "5"; output = "${monitors.side}";}
                    { workspace = "6"; output = "${monitors.side}";}
                    { workspace = "7"; output = "${monitors.main}";}
                    { workspace = "8"; output = "${monitors.side}";}
                    { workspace = "9"; output = "${monitors.main}";}
                ];
            };
   };
}
