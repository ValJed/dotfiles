{ config, pkgs, lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 2;
      shell = "zsh";
      font_size = 12;
      # font_family = "FiraCode Nerd Font";
    };
  };
}

