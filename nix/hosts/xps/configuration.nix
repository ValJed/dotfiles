{ pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.self.outputs.nixosModules.default
  ];

  networking.hostName = "jed_xps"; # Define your hostname.
}
