{ config, lib, pkgs, ... }:

{
  imports = [ 
        <home-manager/nixos> 
  ];

  home-manager.users.aszegedi = { pkgs, ... }: {
    home.stateVersion = "24.05";
    home.packages = with pkgs; [
      eza fastfetch fd gh git htop jq mc neovim nvtopPackages.amd
      unzip ripgrep wget xfce.thunar yadm
    ];

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        text-scaling-factor = 1.4;
        cursor-theme = "Bibata-Modern-Ice";
        cursor-size = 36;
      };
    };

    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome.gnome-themes-extra;
      };
      font = {
          name = "DejaVu Sans";
          size = 11;
      };
    };

    qt = {
      enable = true;
      style = {
          name = "adwaita-dark";
      };
    };
    
    programs.foot = {
        enable = true;
        settings = import ./programs/foot.nix;
    };
    
    programs.bat = {
      enable = true;
      config = {
        theme = "TwoDark";
      };
    };

    programs.fastfetch = {
        enable = true;
        settings = import ./programs/fastfetch.nix;
    };

    programs.tofi = {
        enable = true;
        settings = import ./programs/tofi.nix;
    };

    programs.waybar = {
        enable = true;
        style = (import ./programs/waybar/style.nix).style;
        settings = import ./programs/waybar/settings.nix;
    };

    wayland.windowManager.hyprland = {
        enable = true;
        settings = (import ./programs/hyprland).settings;
        extraConfig = (import ./programs/hyprland).extraConfig;
    };
  };
}
