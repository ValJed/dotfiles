{pkgs, ...}: {
  # Not working
  # services.displayManager.ly = {
  #   enable = true;
  #   settings = {
  #     animation = "matrix";
  #   };
  # };

  environment.systemPackages = [
    (
      pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        font = "FiraCode Nerd Font";
        fontSize = "12";
        background = "${../../../assets/wallpaper.png}";
        loginBackground = true;
      }
    )
  ];
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };
}
