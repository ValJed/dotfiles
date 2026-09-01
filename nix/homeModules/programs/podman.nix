{pkgs, ...}: {
  home.packages = [
    pkgs.podman-compose
  ];

  services.podman = {
    enable = true;
    settings = {
      registries = {
        search = ["docker.io"];
      };
    };
  };

  home.sessionVariables = {
    PODMAN_COMPOSE_PROVIDER = "${pkgs.podman-compose}/bin/podman-compose";
  };
}
