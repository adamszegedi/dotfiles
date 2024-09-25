{ ... }:
{


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aszegedi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  imports = [ 
      ./aszegedi/homemanager.nix 
  ];

  systemd.tmpfiles.rules = [
    "d /mnt/Nessy 0755 aszegedi users"
    "d /mnt/backup 0755 aszegedi users"
  ];

  fileSystems."/home/aszegedi/Games" = { 
      device = "/dev/disk/by-uuid/db2640a7-927d-46b5-b790-9090d5a39c24";
      fsType = "btrfs";
      options = [ "subvol=@Games" "compress=zstd" "noatime" ];
  };

  fileSystems."/mnt/Nessy/media" = {
    device = "nessy:/volume3/Media";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=600"];
  };
  
  fileSystems."/mnt/Nessy/downloads" = {
    device = "nessy:/volume2/Download";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=600"];
  };

  fileSystems."/mnt/backup" = {
    device = "/dev/disk/by-uuid/7c63fdac-9a3f-48ee-8b1e-2bc8968f182f"; 
    fsType = "btrfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "compress=zstd"];
  };

}
