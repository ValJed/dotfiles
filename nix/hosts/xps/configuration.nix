{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.self.outputs.nixosModules.default
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
