{pkgs, ...}: {
  stylix.targets.gtk.enable = true;

  gtk = {
    enable = true;
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
  };
}
