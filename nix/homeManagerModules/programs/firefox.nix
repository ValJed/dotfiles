
{ config, pkgs, lib, ... }:

{
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
  };
}
