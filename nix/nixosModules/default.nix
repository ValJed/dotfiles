# Edit this configuration file to define what should be installed on your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{

  imports = [
    ./services/dev.nix
    ./services/sddm/default.nix
    # ./services/act/default.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # pkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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

  # Configure console keymap
  console.keyMap = "fr";

  users.groups = {
    docker = {};
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jed = {
    isNormalUser = true;
    description = "jed";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "docker" 
    ];
    packages = with pkgs; [ home-manager ];
  };

   # TODO: Fix that
   security.sudo.extraRules = [
     { 
       groups = [ "wheel" ]; 
       commands = [ 
         { 
           command = "${pkgs.brillo}/bin/brillo"; 
           options = ["SETENV" "NOPASSWD"]; 
         }
       ]; 
     }
   ]; 

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Apps
    chromium
    spotify
    libreoffice-qt
    gthumb
    qbittorrent
    vlc
    discord
    slack
    obsidian
    easyeffects

    # Tools
    wev
    zip
    unzip
    stow
    git
    signal-desktop
    xfce.thunar
    file
    lsof
    jq

    # Hyprland
    waybar
    networkmanagerapplet
    wl-clipboard
    rofi-wayland
    dunst
    libnotify
    cliphist
    brillo
    hyprlock
    grim
    slurp
    wf-recorder
    swappy

    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
  ];

  # HYPRLAND
  programs.hyprland.enable = true;

  environment.variables = {
    PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        FastConnectable = "true";
        Experimental = "true";
      };
    };
  };

  services.blueman.enable = true;
  # services.blueman-applet.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

