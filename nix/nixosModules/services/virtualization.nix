{...}: {
  programs.virt-manager.enable = true;

  virtualisation = {
    docker.enable = true;
    oci-containers.containers.mdb = {
      autoStart = true;
      image = "mongo:5";
      ports = ["27017:27017"];
      volumes = [
        "/var/lib/mongodb:/data/db"
      ];
    };
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.groups.libvirtd.members = ["jed"];
}
