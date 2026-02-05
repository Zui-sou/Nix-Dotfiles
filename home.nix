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
    extraConfig = "unbind-key Space"
  };

  programs.zsh = {
    enable = true;
    initContent = ''
      bindkey -r '^S'
      stty -ixon
    '';
    shellAliases = {
      edit = "nvim";
      sedit = "sudo nvim";
      gitTree = "git --no-pager log --oneline --graph --decorate --all"
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
