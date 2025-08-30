{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/default.nix
  ];

  networking.hostName = "jedyoga"; # Define your hostname.

  boot.kernelModules = [
    "btusb"
    "btintel"
  ];
}
