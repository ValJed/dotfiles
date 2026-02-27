{
  config,
  lib,
  hostname,
  ...
}: let
  font_size =
    if hostname == "desktop"
    then 11
    else 13;
in {
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = lib.mkForce font_size;
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
    extraConfig = ''
      color8 ${config.lib.stylix.colors.withHashtag.base08}
    '';
  };

  stylix.targets.kitty.enable = true;
}
