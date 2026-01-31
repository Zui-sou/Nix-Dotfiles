{ config, ... }:

{
  fileSystems."/mnt/pool" = {
    fsType = "fuse.mergerfs";
    device = "/mnt/disk1:/mnt/disk2";

    options = [
     "allow_other"
     "category.create=mfs"
     "use_ino"
     "minfreespace=50G"
    ];
    depends = [ "/mnt/disk1" "/mnt/disk2" ];
  };

  systemd.tmpfiles.rules = [
    "d /mnt/storage/media 0775 - media - -"
  ];
}
