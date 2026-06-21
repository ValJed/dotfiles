{
  pkgs,
  config,
  user,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/default.nix
  ];

  kanata.enable = false;

  fileSystems."/media" = {
    device = "/dev/disk/by-label/media_disk";
    fsType = "ext4";
    options = ["nofail"];
  };

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    # bottles
    mangohud
    obs-studio
    protonup-ng
  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };

  # services.ollama = {
  #   enable = true;
  #   package = pkgs.ollama-cuda;
  # };

  environment.sessionVariables = {
    # Hint electron apps to use wayland
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${user}/.steam/root/compatibilitytools.d";
  };

  networking.hostName = "jed_desktop";
}
