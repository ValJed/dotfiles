{...}: let
  monitor1 = "HDMI-A-1";
  monitor2 = "DP-3";
in {
  imports = [
    ../../homeModules/default.nix
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      hl.config({ cursor = { no_hardware_cursors = true } })

      hl.env("LIBVA_DRIVER_NAME", "nvidia")
      hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
    '';
    settings = {
      monitor = [
        {
          output = "${monitor1}";
          mode = "1920x1080";
          position = "0x0";
          scale = 1;
        }
        {
          output = "${monitor2}";
          mode = "1920x1080";
          position = "1920x0";
          scale = 1;
        }
      ];

      workspace_rule = [
        {
          workspace = 1;
          monitor = monitor1;
        }
        {
          workspace = 2;
          monitor = monitor2;
        }
        {
          workspace = 3;
          monitor = monitor1;
        }
        {
          workspace = 4;
          monitor = monitor2;
        }
        {
          workspace = 5;
          monitor = monitor2;
        }
        {
          workspace = 6;
          monitor = monitor2;
        }
      ];
    };
  };
}
