{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/default.nix
  ];

  kanata.enable = false;

  # Crash
  # fileSystems."/media" = {
  #   device = "/dev/sdb1";
  #   fsType = "ext4";
  # };

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
    protonup-ng
    bottles
    obs-studio
  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics.enable = true;
    # 580.65.06 (current working if need to pin it)
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
      # production = 580.126.09; CUDA = 13.0
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };
  services.ollama.acceleration = "cuda";
  services.ollama.package = pkgs.ollama-cuda;

  environment.sessionVariables = {
    #Hint electron apps to use wayland
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/jed/.steam/root/compatibilitytools.d";
  };

  networking.hostName = "jed_desktop";
}
