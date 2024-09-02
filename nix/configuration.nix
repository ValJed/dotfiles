# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-8b83c743-2c4d-47ca-ad0d-00cc2680314e".device = "/dev/disk/by-uuid/8b83c743-2c4d-47ca-ad0d-00cc2680314e";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = [
    "btusb"
    "btintel"
  ];

  networking.hostName = "jedyoga"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  hardware.enableAllFirmware = true;
  # sound.enable = true;

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
    # Commented to test hyprland
    #displayManager = {
    #defaultSession = "none+i3";
    #};
    
      #windowManager.i3 = {
      #enable = true;
      #extraPackages = with pkgs; [
      #rofi
      #i3status
      #i3lock
      #polybar
      #feh
      #];
      #};

    xserver = {
      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "fr";
        variant = "azerty";
        model = "pc105";
      };
      # Screen setup
      xrandrHeads = [
        {
          output = "eDP-1";
          primary = true;
        }
      ];
    };
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jed = {
    isNormalUser = true;
    description = "jed";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Commented for Hyprland
  #nixpkgs.config = {
  #packageOverrides = pkgs: rec {
  #polybar = pkgs.polybar.override {
  #i3Support = true;
  #};
  #};
  #};

  # Programs configs
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Apps
    firefox
    spotify

    # Tools
    wev
    wezterm
    stow
    git
    tmux
    eza
    bat
    lazygit
    btop
    fzf
    zoxide
    yazi
    pass
    starship
    ripgrep
    tokei
    signal-desktop
    libsForQt5.dolphin
    xfce.thunar
    vlc

    # Dev
    python3
    gcc14
    nodejs_20
    docker_27
    docker-compose
    rustup
    pkg-config 

    #bluez
    #blueman

    networkmanagerapplet

    # Hyprland
    #waybar
    wl-clipboard
    rofi-wayland
    dunst
    libnotify
    # To remove
    kitty
    swww
    cliphist
    brillo

    (firefox.override { nativeMessagingHosts = [ passff-host ]; }) 
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
  ];

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # HYPRLAND
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # If needed
  environment.sessionVariables = {
    #If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    #Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}