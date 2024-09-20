{ pkgs, services, ... }:
{
    services.swayidle = {
        enable = true;
        timeouts = [
            { 
                timeout = 300;
                command = "${pkgs.swaylock}/bin/swaylock -fF";
            }
            { 
                timeout = 330;
                command = "${pkgs.sway}/bin/swaymsg \"output * dpms off\""; 
                resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * dpms on\"";
            }
        ];
    };
}

