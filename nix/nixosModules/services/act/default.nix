{pkgs, lib, ...}: let
  act = import ./act.nix {inherit pkgs; inherit lib;};
in {
  environment.systemPackages = [
    act
  ];
}
