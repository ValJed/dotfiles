{...}: {
  imports = [
    ../../homeModules/default.nix
  ];

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        ",preferred,auto,1.6"
      ];
    };
  };
}
