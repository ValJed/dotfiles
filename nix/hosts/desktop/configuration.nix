{ pkgs, lib, inputs, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.self.outputs.nixosModules.default
  ];

  networking.hostName = "jed_desktop"; # Define your hostname.
}
