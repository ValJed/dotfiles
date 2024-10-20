{ config, pkgs, lib, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
