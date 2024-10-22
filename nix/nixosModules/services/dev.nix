
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mongosh
    docker-compose
  ];

  virtualisation.docker.enable = true;
}

