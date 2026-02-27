{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../homeManagerModules/default.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    image = ../../../assets/wallpaper.png;
  };
}
