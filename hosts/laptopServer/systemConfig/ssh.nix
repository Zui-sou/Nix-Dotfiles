{ pkgs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 69 ];
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PubkeyAuthentication = true;
    };

    extraConfig = ''
      AllowUsers maboroshi
    '';
  };
}
