{...}: {
  imports = [
    ../../homeManagerModules/default.nix
  ];

  home.file = {
    ".config/hypr/hyprland.conf" = {
      source = ../../../hypr/laptop.conf;
    };
  };
}
