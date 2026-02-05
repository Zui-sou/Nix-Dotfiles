{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ sonarr ];

  services.sonarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  systemd.services.sonarr = {
    requires = [ "mnt-pool.mount" ];
    after = [ "mnt-pool.mount" ];
  };
}
