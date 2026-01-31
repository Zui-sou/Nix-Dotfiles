{ config, ... }:

{
  fileSystems."/mnt/disk1" = {
    device = "/dev/disk/by-uuid/28599f51-d400-47a3-9818-deefd763bf1f";
    fsType = "ext4";
    options = [
      "nofail"
      "x-systemd.automount"
   ];
  };

  fileSystems."/mnt/disk2" = {
    device = "/dev/disk/by-uuid/775a34bf-23b8-45ef-92c8-f82f54e77074";
    fsType = "ext4";
    options = [
      "nofail"
      "x-systemd.automount"
   ];
  };
}
