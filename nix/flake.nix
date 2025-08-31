{
  description = "flake for main";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    mkNixosConfig = {
      hostname,
      nixpkgs,
      home-manager,
    }:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          hostname = hostname;
        };
        modules = [
          stylix.nixosModules.stylix
          ./hosts/${hostname}/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.jed = ./hosts/${hostname}/home.nix;

              extraSpecialArgs = {
                hostname = hostname;
              };
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      xps = mkNixosConfig {
        hostname = "xps";
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
      };
      desktop = mkNixosConfig {
        hostname = "desktop";
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
      };
    };
  };
}
