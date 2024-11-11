{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 24;
    };
    theme = {
      name = "rose-pine-moon";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "rose-pine-moon";
      package = pkgs.rose-pine-icon-theme;
    };
  };
}
