{
  lib,
  hostname,
  ...
}: let
  font_size =
    if hostname == "desktop"
    then 11
    else 13;
in {
  programs.kitty = lib.mkForce {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = font_size;
    };
    settings = {
      confirm_os_window_close = 2;
      shell = "zsh";
      cursor_trail = 3;
      window_padding_width = 2;
    };
    keybindings = {
      "ctrl+shift+right" = "no_op";
      "ctrl+shift+left" = "no_op";
    };
  };

  stylix.targets.kitty.enable = true;
}
