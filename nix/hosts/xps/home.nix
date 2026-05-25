{...}: {
  imports = [
    ../../homeModules/default.nix
  ];

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = 1.6;
        }
      ];
    };
  };
}
