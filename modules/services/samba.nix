{ configs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ samba ];
  
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      "global" = {
        "invalid users" = [ "root" ];
        "passwd program" = "/run/wrappers/bin/passwd %u";
        security = "user";
      };
  

      "Founding" = {
        "path" = "/mnt/pool";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "maboroshi";
        "force group" = "media";
      };
    };
  };

  systemd.services.samba = {
    requires = [ "mnt-pool.mount" ];
    after = [ "mnt-pool.mount" ];
  };

  system.activationScripts.sambaPassword = {
    text = ''
      echo -e "password\npassword" | ${pkgs.samba}/bin/smbpasswd -s -a maboroshi
    '';
    deps = [ "users" ];
  };
}
