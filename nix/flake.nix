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
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    mkNixosConfig = {
      hostname,
      nixpkgs,
      home-manager,
      neovim-nightly,
    }:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          hostname = hostname;
          system = system;
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
                system = system;
                neovim-nightly = neovim-nightly;
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
        neovim-nightly = inputs.neovim-nightly-overlay;
      };
      desktop = mkNixosConfig {
        hostname = "desktop";
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
        neovim-nightly = inputs.neovim-nightly-overlay;
      };
    };
  };
}
