{
  description = "flake for main";

  nixConfig = {
    extra-substituters = ["https://cache.numtide.com"];
    extra-trusted-public-keys = ["niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="];
  };

  inputs = {
    # nixpkgs-ollama.url = "github:NixOS/nixpkgs/8c3cede7ddc26bd659d2d383b5610efbd2c7a16e";
    llm-agents.url = "github:numtide/llm-agents.nix";
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
          {nixpkgs.overlays = [inputs.llm-agents.overlays.default];}
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
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          overlays = [inputs.llm-agents.overlays.default];
        };
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
