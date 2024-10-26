
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mongosh
    docker-compose
  ];

  virtualisation.docker.enable = true;

  # Setup mongodb container
  # virtualisation.oci-containers = {
  #   enable = true;
  #   containers.mycontainer = {
  #     image = "your-image-name:tag";
  #     ports = [ "8080:80" ];
  #     volumes = [ "/path/on/host:/container/path" ];
  #   };
  # };
}

