{ pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.self.outputs.nixosModules.default
    ];

  networking.hostName = "jedyoga"; # Define your hostname.
}
