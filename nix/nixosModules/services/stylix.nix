{
  pkgs,
  lib,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    polarity = lib.mkDefault "dark";
    image = ../../../assets/wallpaper.png;
    cursor = {
      name = lib.mkDefault "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };

      sizes = {
        popups = 12;
      };
    };

    icons = {
      enable = true;
      package = pkgs.rose-pine-icon-theme;
    };
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "toggle-theme" ''
      if [ "$THEME_MODE" = "dark" ]; then
        sudo nixos-rebuild --flake ~/dotfiles/nix switch --specialisation light
      else
        sudo nixos-rebuild --flake ~/dotfiles/nix switch
      fi
      tmux source ~/.config/tmux/tmux.conf 2>/dev/null || true
    '')
  ];

  environment.sessionVariables = {
    THEME_MODE = lib.mkDefault "dark";
  };

  specialisation.light.configuration = {
    stylix = {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-dawn.yaml";
      polarity = "light";
      cursor.name = "BreezeX-RosePineDawn-Linux";
    };
    environment.sessionVariables = {
      THEME_MODE = "light";
    };
  };
}
# Current theme:
# system: "base16"
# name: "Rosé Pine"
# author: "Emilia Dunfelt <edun@dunfelt.se>"
# slug: "rose-pine"
# variant: "dark"
# palette:
#   base00: "#191724"
#   base01: "#1f1d2e"
#   base02: "#26233a"
#   base03: "#6e6a86"
#   base04: "#908caa"
#   base05: "#e0def4"
#   base06: "#e0def4"
#   base07: "#524f67"
#   base08: "#eb6f92"
#   base09: "#f6c177"
#   base0A: "#ebbcba"
#   base0B: "#31748f"
#   base0C: "#9ccfd8"
#   base0D: "#c4a7e7"
#   base0E: "#f6c177"
#   base0F: "#524f67"

