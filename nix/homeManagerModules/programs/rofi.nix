{...}: {
  programs.rofi = {
    enable = true;
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
  };
}
