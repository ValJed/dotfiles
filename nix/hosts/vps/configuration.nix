{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "jed_vps";

  # Boot
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

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
        layout = "us";
        variant = "altgr-intl";
      };
    };

    openssh.enable = true;
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRE0ANVW9mr2uOa+QjAewaYzKe83pv8tf8bPD4Z8GtYZR5P57h/ANtLGvTL/fSeyxgIb+8gHVLD1sxHBBtYkPKM7q56A+VzAJYye6YmunEY2apzhPvwCroixOR+6djgRNL8Qrzfb9KKclupBKxmWfGUOJ7hMYSKbaZE1UUrsRHBvIHd4CMt7oKkuH1Bxys2xfwfV0B9ghaTrOUzBk2Fr1KaeWiDAoVMG17oqnfI/7IGYMnABhDYI2QiFmygjDmj0/kP/ylX9ABVT7iWdwsg6XeiS2T/A/O3w99xZGqmBcmbr2c2NozshFcRPfeigLQZ50+reWOE9RnioPnpZ4n1dRs6egRiMjS9ngm13rqmSN9KW1GXvldFae86yjVo+lhuHKU/w+xh0DCCc1E2zVFk5l4KdwMUAcJ7N8aYIT3kfjZGMvW86TWXWHEBJTws1uiisozXigONRAVtpD+BY8EAm02k39j9Q1oeObgWWP27n0dN4ak7mPF6extUTScnnJRqVtpoQOdd/HAUxnqI+CX2UfmpnCiddEJdRl+x/W6CENssfxDwDXD7Nl5ioxeXfqb/b+H90OblFDv4yX9jyFCeHalRx3Dv9bYYUYi9ydwfSlElnLzhawIHLSRp6JHYIF9dXo+w/PMc9FRbWU/WRDXxCUMQPHjX4eL8wYJRx05wRtBiQ== val@val-pc"
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    zip
    unzip
    lsof
    jq
    git
    curl
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  system.stateVersion = "26.11";
}
