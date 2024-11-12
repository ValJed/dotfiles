{ config, pkgs, lib, ... }: let
  act-update = import ./scripts/act-update.nix {inherit pkgs;};
  task = import ./scripts/task.nix {inherit pkgs; inherit lib;};
in {
  environment.systemPackages = [
    pkgs.mongosh
    pkgs.dig
    pkgs.awscli2
    pkgs.alejandra
    pkgs.kitty
    pkgs.python3
    pkgs.gcc14
    pkgs.nodejs_20
    pkgs.mongodb-tools

    # Rust
    pkgs.pkg-config 
    pkgs.cargo
    pkgs.rustc
    pkgs.openssl

    act-update
    task
  ];

  virtualisation.docker.enable = true;

  # Setup mongodb container
  virtualisation.oci-containers.containers.mdb = {
    autoStart = true;
    image = "mongo:5";
    ports = [ "27017:27017" ];
    volumes = [
      "/var/lib/mongodb:/data/db"
    ];
  };
}

