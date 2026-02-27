{...}: let
  monitor1 = "HDMI-A-1";
  monitor2 = "DP-3";
in {
  imports = [
    ../../homeModules/default.nix
  ];

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "${monitor1}, 1920x1080, 0x0, 1"
        "${monitor2}, 1920x1080, 1920x0, 1"
      ];

      workspace = [
        "1, monitor:${monitor1}"
        "2, monitor:${monitor2}"
        "3, monitor:${monitor1}"
        "4, monitor:${monitor2}"
        "5, monitor:${monitor2}"
      ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      cursor = {
        no_hardware_cursors = true;
      };
    };
  };

  # home.file = {
  #   ".config/hypr/hyprland.conf" = {
  #     source = ../../../hypr/desktop.conf;
  #   };
  # };
}
