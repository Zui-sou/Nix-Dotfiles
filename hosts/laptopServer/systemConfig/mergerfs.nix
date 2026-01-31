{ config, ... }:

{
  fileSystems."/mnt/storage" = {
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
}
