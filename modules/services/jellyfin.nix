{ configs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ jellyfin ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  systemd.services.jellyfin = {
    requires = [ "mnt-pool.mount" ];
    after = [ "mnt-pool.mount" ];
  };
}
