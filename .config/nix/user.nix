{ config, lib, pkgs, ... }:

{

  imports = [ 
        ./aszegedi/homemanager.nix 
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aszegedi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  systemd.tmpfiles.rules = [
    "d /mnt/Nessy 0755 aszegedi users"
  ];

  fileSystems."/home/aszegedi/Games" = { device = "/dev/disk/by-uuid/db2640a7-927d-46b5-b790-9090d5a39c24";
      fsType = "btrfs";
      options = [ "subvol=@Games" "compress=zstd" "noatime" ];
  };

  fileSystems."/mnt/Nessy/media" = {
    device = "nessy:/volume3/Media";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=600"];
    fsType = "nfs";
  };
  
  fileSystems."/mnt/Nessy/downloads" = {
    device = "nessy:/volume2/Download";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=600"];
    fsType = "nfs";
  };

}
