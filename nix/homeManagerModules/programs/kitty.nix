{
  lib,
  hostname,
  ...
}: let
  font_size =
    if hostname == "desktop"
    then "11.0"
    else "13.0";
in {
  programs.kitty = lib.mkForce {
    enable = true;
    # settings = {
    #   confirm_os_window_close = 2;
    #   shell = "zsh";
    #   font_size = font_size;
    #   font_family = "FiraCode Nerd Font";
    #   cursor_trail = 3;
    # };
    extraConfig = ''
      confirm_os_window_close 2
      shell "zsh"
      font_size ${font_size}
      font_family "FiraCode Nerd Font"
      cursor_trail 3

      map ctrl+shift+right no_op
      map ctrl+shift+left no_op

      # Paste from clipboard
      map ctrl+shift+p paste_from_clipboard

      foreground               #e0def4
      background               #191724
      selection_foreground     #e0def4
      selection_background     #403d52

      cursor                   #524f67
      cursor_text_color        #e0def4

      url_color                #c4a7e7

      active_tab_foreground    #e0def4
      active_tab_background    #26233a
      inactive_tab_foreground  #6e6a86
      inactive_tab_background  #191724

      active_border_color      #31748f
      inactive_border_color    #403d52

      # black
      color0   #26233a
      color8   #6e6a86

      # red
      color1   #eb6f92
      color9   #eb6f92

      # green
      color2   #31748f
      color10  #31748f

      # yellow
      color3   #f6c177
      color11  #f6c177

      # blue
      color4   #9ccfd8
      color12  #9ccfd8

      # magenta
      color5   #c4a7e7
      color13  #c4a7e7

      # cyan
      color6   #ebbcba
      color14  #ebbcba

      # white
      color7   #e0def4
      color15  #e0def4
    '';
  };
}
