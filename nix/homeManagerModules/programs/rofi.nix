{
  config,
  pkgs,
  ...
}: {
  stylix.targets.rofi.enable = true;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [
      pkgs.rofi-emoji-wayland
    ];

    extraConfig = {
      kb-row-up = "Up,Control+k";
      kb-row-down = "Down,Control+j";
      kb-accept-entry = "Control+m,Return,KP_Enter";
      kb-remove-to-eol = "Control+r";
      kb-row-right = "Control+d";
      kb-remove-to-sol = "";
      kb-row-left = "Control+u";
      kb-remove-char-forward = "Delete";
      kb-remove-char-back = "BackSpace";
      kb-mode-complete = "";
      kb-mode-next = "Control+l";
      kb-mode-previous = "Control+h";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        separator-style = "none";
        margin = 0;
      };

      window = {
        border = mkLiteral "1px";
        border-radius = mkLiteral "40px";
        children = mkLiteral "[mainbox]";
      };

      mainbox = {
        border = 0;
        orientation = mkLiteral "vertical";
        children = mkLiteral "[ entry,message,listview,mode-switcher ]";
      };

      entry = {
        placeholder = " Search...";
        expand = false;
        padding = mkLiteral "10px 0px 10px 0px";
        border = mkLiteral "0 0 1px";
        margin = mkLiteral "30px 30px 0px 30px";
      };

      sidebar = {
        expand = false;
      };

      textbox = {
        horizontal-align = 0;
        padding = mkLiteral "10px 20px 10px 20px";
      };

      listview = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "20 30 70 30";
      };

      mode-switcher = {
        margin = mkLiteral "10px 30px 30px 30px";
      };

      button = {
        padding = mkLiteral "8px";
      };

      element = {
        border = 0;
        padding = mkLiteral "10px 20px 10px 20px";
      };
    };
  };
}
