{ pkgs, services, ... }:
{
    services.swayidle = {
        enable = true;
        timeouts = [
            { 
                timeout = 300;
                command = "~/.config/swaylock/lock.sh";
            }
            { 
                timeout = 330;
                command = "${pkgs.sway}/bin/swaymsg \"output * dpms off\""; 
                resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * dpms on\"";
            }
        ];
    };
}

