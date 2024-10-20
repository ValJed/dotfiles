{ config, lib, ... }:

{
  programs.qt= {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };
}
