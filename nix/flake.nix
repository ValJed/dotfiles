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

    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        hostname = "desktop";
        # homeManagerPath = ./hosts/desktop/home.nix;
      };
      modules = [
        stylix.nixosModules.stylix
        ./hosts/desktop/configuration.nix
      ];
    };

    nixosConfigurations = {
      xps = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          hostname = "xps";
        };
        modules = [
          stylix.nixosModules.stylix
          ./hosts/xps/configuration.nix
        ];
      };

      yoga = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/yoga/configuration.nix
        ];
      };
    };

    nixosModules.default = ./nixosModules;
  };
}
