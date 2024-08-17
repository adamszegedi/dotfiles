{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aszegedi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      neovim gnome3.gnome-tweaks mc yadm gh nvtopPackages.amd htop
      git eza bat
    ];
  };

  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" "SourceCodePro"]; }) ];

  fileSystems."/home/aszegedi/Games" = { device = "/dev/disk/by-uuid/db2640a7-927d-46b5-b790-9090d5a39c24";
      fsType = "btrfs";
      options = [ "subvol=@Games" "compress=zstd" "noatime" ];
  };
}
