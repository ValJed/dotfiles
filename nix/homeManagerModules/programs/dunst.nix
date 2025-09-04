{...}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 400;
        offset = "(10, 10)";
        progress_bar_min_width = 380;
        progress_bar_max_width = 380;
        progress_bar_corner_radius = 2;
        padding = 10;
        horizontal_padding = 5;
        frame_width = 1;
        gap_size = 5;
        icon_theme = "BreezeX-RosePine-Linux";
        enable_recursive_icon_lookup = true;
        corner_radius = 10;
      };
    };
  };

  stylix.targets.dunst.enable = true;
}
