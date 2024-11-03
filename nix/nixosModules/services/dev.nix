{ config, pkgs, lib, ... }: let
  act-update = import ./scripts/act-update.nix {inherit pkgs;};
  task = import ./scripts/task.nix {inherit pkgs; inherit lib;};
in {
  environment.systemPackages = [
    pkgs.mongosh
    pkgs.docker-compose
    pkgs.dig
    pkgs.awscli2
    act-update
    task
  ];

  virtualisation.docker.enable = true;

  # Setup mongodb container
  # virtualisation.oci-containers = {
  #   containers.mdb = {
  #     autoStart = true;
  #     image = "mongo:5";
  #     ports = [ "27017:27017" ];
  #     volumes = [ "mdb:/data/db" ];
  #   };
  # };
}

