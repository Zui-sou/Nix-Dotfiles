{ configs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ prowlarr ];

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.prowlarr = {
    requires = [ "mnt-pool.mount" ];
    after = [ "mnt-pool.mount" ];
  };
}
