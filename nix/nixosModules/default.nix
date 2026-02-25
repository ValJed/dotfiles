{pkgs, ...}: {
  imports = [
    ./services/dev.nix
    ./services/displayManager.nix
    ./services/kanata.nix
    ./services/stylix.nix
    ./services/virtualization.nix
    ./services/mouse.nix
    ./services/agents.nix
    ./services/omnissa.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.download-buffer-size = 524288000;

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Hardware
  hardware.enableAllFirmware = true;
  hardware.keyboard.zsa.enable = true;

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
        layout = "us";
        variant = "altgr-intl";
      };
    };
  };

  # Configure console keymap
  console.keyMap = "us";

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
      "libvirt"
      "uinput"
      "plugdev"
    ];
    packages = with pkgs; [home-manager];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Apps
    chromium
    libreoffice-qt
    gthumb
    qbittorrent
    vlc
    easyeffects
    pinta
    keymapp

    # Tools
    wev
    zip
    unzip
    # git
    signal-desktop
    thunar
    file
    lsof
    jq
    ffmpeg
    playerctl
    usbutils
    ntfs3g
    exfatprogs
    xh
    exiftool
    zathura
    enca
    haskellPackages.subtitles

    # Hyprland
    waybar
    networkmanagerapplet
    wl-clipboard
    dunst
    libnotify
    cliphist
    brightnessctl
    hyprlock
    grim
    slurp
    wf-recorder
    swappy

    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
  ];

  # HYPRLAND
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";

    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
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

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      extraConfig = {
        "bluetooth.conf" = {
          "monitor.bluez.properties" = {
            "bluez5.auto-connect" = ["a2dp_sink" "hfp_hf"];
          };
        };
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
