{
    settings = import ./hyprland.nix;
    extraConfig = builtins.readFile ./startup-apps.conf;
}
