{ ... }:
{
  imports = [ 
        <home-manager/nixos> 
  ];

  home-manager.useUserPackages = true;

  home-manager.users.aszegedi = { pkgs, ... }: {
    imports = [
        ./programs/mpv.nix
        ./programs/neovim.nix
        ./programs/sway.nix
        ./programs/swaylock.nix
        ./programs/swayidle.nix
        ./programs/alacritty.nix
        ./programs/tofi.nix
        ./services/mako.nix
        ./xdg.nix
    ];

    home.stateVersion = "24.05";
    home.packages = with pkgs; [
      alacritty-theme eza fastfetch fd gh git htop imagemagick jq mc nvtopPackages.amd
      pavucontrol unzip ripgrep wget xfce.thunar yadm 
    ];

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        text-scaling-factor = 1.4;
        cursor-theme = "Bibata-Modern-Ice";
        cursor-size = 32;
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
    
    programs.bat = {
      enable = true;
      config = {
        theme = "TwoDark";
      };
    };

    programs.bash = (import ./programs/sh.nix).bash;

    programs.fastfetch = {
        enable = true;
        settings = import ./programs/fastfetch.nix;
    };

    programs.waybar = {
        enable = true;
        style = (import ./programs/waybar).style;
        settings = (import ./programs/waybar).settings;
    };
    
  };
}
