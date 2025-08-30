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
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
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
          hostname = "xps";
        };
        modules = [
          stylix.nixosModules.stylix
          ./hosts/xps/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.jed = ./hosts/xps/home.nix;

              extraSpecialArgs = {
                hostname = "xps";
              };
            };
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          hostname = "desktop";
        };
        modules = [
          stylix.nixosModules.stylix
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
  };
}
