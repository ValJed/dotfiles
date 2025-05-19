{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.self.outputs.nixosModules.default
  ];

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    bottles
    obs-studio

    # Test
    qutebrowser
  ];

  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics.enable = true;
    # 565.77 (current working if need to pin it)
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  environment.sessionVariables = {
    #If your cursor becomes invisible
    # WLR_NO_HARDWARE_CURSORS = "1";
    #Hint electron apps to use wayland
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/jed/.steam/root/compatibilitytools.d";
  };

  networking.hostName = "jed_desktop"; # Define your hostname.
}
