{ pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.self.outputs.nixosModules.default
    ];

  networking.hostName = "jedyoga"; # Define your hostname.
  
  boot.initrd.luks.devices."luks-8b83c743-2c4d-47ca-ad0d-00cc2680314e".device = "/dev/disk/by-uuid/8b83c743-2c4d-47ca-ad0d-00cc2680314e";
  boot.kernelModules = [
    "btusb"
    "btintel"
  ];
}
