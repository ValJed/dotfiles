{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/default.nix
  ];

  kanata.enable = true;

  hardware = {
    nvidia.modesetting.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [intel-media-driver];
    };
  };

  networking.hostName = "jed_xps"; # Define your hostname.
}
