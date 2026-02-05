{ config, ... }:

{
  networking.interfaces.wlp3s0.ipv4.addresses = [
    {
      address = "192.168.4.213";
      prefixLength = 24;
    }
  ];

  networking.interfaces.enp4s0.ipv4.addresses = [
    {
      address = "192.168.4.213";
      prefixLength = 24;
    }
  ];

  networking.defaultGateway = "192.168.4.1";
  networking.nameservers = [ "8.8.8.8" ];
}
