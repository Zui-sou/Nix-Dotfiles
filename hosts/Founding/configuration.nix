{ configs, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./system.nix
      ./services.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

  networking.hostName = "Founding";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Denver";

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.maboroshi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "media" ];
  };
  
  users.groups.media = {};
  
  systemd.tmpfiles.rules = [
    "d /mnt/pool 0775 root media - -"
    "d /mnt/pool/media 0775 root media - -"
    "d /mnt/pool/media/Shows 0775 root media - -"
    "d /mnt/pool/media/Movies 0775 root media - -"
  ];

  environment.systemPackages = with pkgs; [
    neovim
    git
    zsh
    ripgrep
    tmux
    mergerfs
    fuse3
    recyclarr
  ];
}
