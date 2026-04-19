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
      user,
      nixpkgs,
      home-manager,
    }:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          hostname = hostname;
          user = user;
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
              backupFileExtension = "backup";
              extraSpecialArgs = {
                hostname = hostname;
                user = user;
              };
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      xps = mkNixosConfig {
        hostname = "xps";
        user = "jed";
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
      };
      desktop = mkNixosConfig {
        hostname = "desktop";
        user = "jed";
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
      };
    };
    homeConfigurations = {
      wsl = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          stylix.homeModules.stylix
          ./hosts/wsl/home.nix
        ];
        extraSpecialArgs = {
          hostname = "wsl";
          user = "jeudyv";
        };
      };
    };
  };
}
