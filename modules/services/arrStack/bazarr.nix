{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ bazarr ];

  services.bazarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  systemd.services.bazarr = {
    requires = [ "mnt-pool.mount" ];
    after = [ "mnt-pool.mount" ];
  };
}
