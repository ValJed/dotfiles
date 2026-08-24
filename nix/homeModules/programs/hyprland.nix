{...}: {
  stylix.targets.hyprland.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    # Use global package
    package = null;
    portalPackage = null;
    extraConfig = ''
      require("config")
    '';
  };

  home.file = {
    ".config/hypr/config.lua" = {
      source = ../../../hyprland/config.lua;
    };
  };
}
