{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ radarr ];

  services.radarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  systemd.services.radarr = {
    requires = [ "mnt-pool.mount" ];
    after = [ "mnt-pool.mount" ];
  };
}
