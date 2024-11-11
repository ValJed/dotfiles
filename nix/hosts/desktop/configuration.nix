{ pkgs, lib, inputs, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.self.outputs.nixosModules.default
  ];

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  # If needed
  environment.sessionVariables = {
    #If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    #Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  networking.hostName = "jed_desktop"; # Define your hostname.
}
