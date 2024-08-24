{ windowManager, monitors }:
{
  mainBar = {
    layer = "top";
    position = "top";
    margin = "0 0 0 0"; 
    output = monitors.main;
    modules-left = ["${windowManager}/workspaces" "group/tray"];
    modules-center = ["clock#time"];
    modules-right = [ "idle_inhibitor" "privacy" "pulseaudio" "network" "memory"];

    "${windowManager}/workspaces" = {
        format = "{name}";
        on-click = "activate";
        all-outputs = true;
    };

    "group/tray" = {
        orientation = "inherit";
        drawer = {
          transition-duration = 300;
          children-class = "not-memory";
          transition-left-to-right = true;
        };
        modules = ["custom/tray" "tray"];
    };

    "custom/tray" = {
      format = "󱊖 ";
      tooltip = false;
    };

    tray = {
        icon-size = 22;
        spacing = 10;
        all-outputs = true;
    };

    "clock#time" = {
        interval = 60;
        format = "{:%a, %d %b, %I:%M %p}";
        tooltip = false;
    };

    network = {
        family = "ipv6";
        format-ethernet = "  {ifname}";
        tooltip = true;
        tooltip-format = "{ipaddr}";
        format-linked = "{iename} (no ip)";
        format-disconnected = "󰈂 disconnected";
        on-click = "ip -6 addr show dev enp5s0 | grep inet6 -m1 | cut -d ' ' -f6 | wl-copy";
    };

    pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = " muted";
        scroll-step = 5;
        on-click = "pactl set-sink-mute 0 toggle";
        on-click-middle = "pavucontrol";
        format-icons =  {
          headphone = "   ";
          hands-free = "   ";
          headset = "   ";
          phone = "   ";
          portable = "   ";
          car = "    ";
          default = ["" " " "󰕾 " " "];
        };
    };

    memory = {
        interval = 30;
        format = " {used:0.1f}G";
        max-length = 20;
    };

    idle_inhibitor = {
        format = "{icon}";
        format-icons = {
            activated = " ";
            deactivated = " ";
        };
        timeout = 30;
    };

    privacy = {
        icon-spacing = 12;
        icon-size = 24;
        transition-duration = 250;
        modules = [
            {
                type = "screenshare";
                tooltip = true;
                tooltip-icon-size = 24;
            }
            
            {
                type = "audio-out";
                tooltip = true;
                tooltip-icon-size = 24;
            }

            {
                type = "audio-in";
                tooltip = true;
                tooltip-icon-size = 24;
            }
        ];
    };

  };
}
