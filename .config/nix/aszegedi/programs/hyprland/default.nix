let
    monitors = {
        main = "DP-3";
        side = "HDMI-A-1";
    };
in
{
    settings = (import ./hyprland.nix {monitors = monitors;});
    extraConfig = builtins.readFile ./startup-apps.conf;
    hyprpaper = (import ../hyprpaper.nix {monitors = monitors;});
    hyprlock = (import ../hyprlock.nix {monitors = monitors;});
    hypridle = import ../hypridle.nix;
    waybar = (import ../waybar {windowManager = "hyprland"; monitors = monitors;});
}
