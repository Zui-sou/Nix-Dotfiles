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

  networking.hostName = "nixServer";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Denver";

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.maboroshi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    zsh
    ripgrep
    tmux
    mergerfs
    fuse3
    cargo
    nil
    tailscale
  ];
}
