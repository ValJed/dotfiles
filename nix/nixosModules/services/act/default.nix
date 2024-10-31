{pkgs, lib, ...}: let
  act = import ./act.nix {inherit pkgs;};
in {

  environment.systemPackages = with pkgs; [
    act
  ];
}
