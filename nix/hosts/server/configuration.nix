{
  pkgs,
  config,
  ...
}: {
  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "jed_server"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Hardware
  hardware.enableAllFirmware = true;

  # Commented to test Hyprland
  #hardware.pulseaudio.enable = true;
  #nixpkgs.config.pulseaudio = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "fr";
        variant = "azerty";
        model = "pc105";
      };
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaPackages = luajitPackages: [
      luajitPackages.inspect
    ];
  };
}
