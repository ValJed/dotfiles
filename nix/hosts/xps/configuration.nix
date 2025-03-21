{
  pkgs,
  lib,
  inputs,
  hostname,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.self.outputs.nixosModules.default
  ];

  hardware = {
    nvidia.modesetting.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [intel-media-driver];
    };
  };

  networking.hostName = "jed_xps"; # Define your hostname.
}
