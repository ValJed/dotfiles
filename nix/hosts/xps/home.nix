{...}: {
  imports = [
    ../../homeManagerModules/default.nix
  ];

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        ",preferred,auto,1.6"
      ];
    };
  };

  # home.file = {
  #   ".config/hypr/hyprland.conf" = {
  #     source = ../../../hypr/laptop.conf;
  #   };
  # };
}
