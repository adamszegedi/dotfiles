{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aszegedi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  home-manager.users.aszegedi = { pkgs, ... }: {
    home.stateVersion = "24.05";
    home.packages = with pkgs; [
      fastfetch neovim mc yadm gh nvtopPackages.amd htop
      git eza bat xfce.thunar 
    ];
    #wayland.windowManager.hyprland.enable = true;

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
  };

  fileSystems."/home/aszegedi/Games" = { device = "/dev/disk/by-uuid/db2640a7-927d-46b5-b790-9090d5a39c24";
      fsType = "btrfs";
      options = [ "subvol=@Games" "compress=zstd" "noatime" ];
  };
}
