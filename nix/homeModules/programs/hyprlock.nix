{...}: {
  stylix.targets.hyprlock.enable = true;

  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        blur_passes = 1;
        blur_size = 7;
      };

      input-field = {
        size = "200, 50";
      };
    };
  };
}
