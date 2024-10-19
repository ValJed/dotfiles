{ config, pkgs, lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 2;
    }
  };
}

