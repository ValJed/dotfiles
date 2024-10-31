{ config, pkgs, ... }: let
  act-update = import ./scripts/act-update.nix {inherit pkgs;};
in {
  environment.systemPackages = with pkgs; [
    mongosh
    docker-compose
    dig
    awscli2
    act-update
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

