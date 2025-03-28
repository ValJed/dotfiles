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

    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs = {
    nixpkgs,
    home-manager,
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
    nixosConfigurations = {
      yoga = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/yoga/configuration.nix
        ];
      };

      xps = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          hostname = "xps";
        };
        modules = [
          ./hosts/xps/configuration.nix
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          hostname = "desktop";
        };
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "jed@xps" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./hosts/xps/home.nix];
        extraSpecialArgs = {
          inherit inputs;
          hostname = "xps";
        };
      };

      "jed@desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./hosts/desktop/home.nix];
        extraSpecialArgs = {
          inherit inputs;
          hostname = "desktop";
        };
      };
    };

    nixosModules.default = ./nixosModules;
    homeManagerModules.default = ./homeManagerModules;
  };
}
