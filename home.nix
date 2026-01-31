{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
  ];

  home.username = "maboroshi";
  home.homeDirectory = "/home/maboroshi";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    hello
  ];

  programs.tmux = {
    enable = true;
    shortcut = "s";
    baseIndex = 1;
  };

  programs.zsh = {
    enable = true;
    initContent = ''
      bindkey -r '^S'
      stty -ixon
    '';
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake 'Nix Dots#nixServer'";
      edit = "nvim";
      sedit = "sudo nvim";
    };

    oh-my-zsh = {
      enable = true;
      theme = "";
      plugins = [ "git" ];
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$nix_shell$directory$git_branch$git_status$character";
      direnv = {
        disabled = false;
        format = "[$symbol$loaded] ";
      };
    
      git_status = {
        conflicted = "⚠️ ";
        modified = "✏️ ";
        staged = "✔️ ";
      };

      hostname = {
        ssh_only = true;
        format = "[@$hostname] ";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
