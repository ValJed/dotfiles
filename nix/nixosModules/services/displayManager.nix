{pkgs, ...}: let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "japanese_aesthetic";
  };
  # catpuccin-sddm = pkgs.catppuccin-sddm.override {
  #   flavor = "mocha";
  #   font = "FiraCode Nerd Font";
  #   fontSize = "12";
  #   background = "${../../../assets/wallpaper.png}";
  # };
in {
  # Not working
  # services.displayManager.ly = {
  #   enable = true;
  #   settings = {
  #     animation = "matrix";
  #   };
  # };

  environment.systemPackages = [
    sddm-astronaut
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    # "catpuccin-mocha"
    theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = [
      sddm-astronaut
    ];
  };
}
