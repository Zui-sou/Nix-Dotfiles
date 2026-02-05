{ 
  description = "Flake for my laptop home server (Founding) and my personal laptop (Cart)";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      Founding = lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/Founding/configuration.nix ];
      };
      
      Cart = lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/Cart/configuration.nix ];
      };
    };

    homeConfigurations = {
      maboroshi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
  };
}
