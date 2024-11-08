{ config, pkgs, inputs, ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/tmux.nix
    ./programs/kitty.nix
    ./programs/gtk.nix
    ./programs/nvim.nix
    ./programs/firefox.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jed";
  home.homeDirectory = "/home/jed";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.wbg
    pkgs.adwaita-qt
    pkgs.lazygit
    pkgs.lazydocker
    pkgs.eza
    pkgs.bat
    pkgs.btop
    pkgs.fzf
    pkgs.zoxide
    pkgs.yazi
    pkgs.pass
    pkgs.starship
    pkgs.ripgrep
    pkgs.tokei
    pkgs.tealdeer 
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprlock.conf".source = ../../hypr/hyprlock.conf;
    ".config/zsh" = {
      source = ../../zsh/.config/zsh;
      recursive = true;
    };
    ".config/starship.toml".source = ../../starship/.config/starship.toml;
    ".config/waybar" = {
      source = ../../waybar/.config/waybar;
      recursive = true;
    };
    ".config/nvim" = {
    	source = ../../nvim/.config/nvim;
	    recursive = true;
    };
    ".config/rofi/config.rasi".source = ../../rofi/.config/rofi/config.rasi;
    ".config/swappy/config".source = ../../swappy/config;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jed/etc/profile.d/hm-session-vars.sh
  
  home.sessionVariables = {
    EDITOR = "nvim";
    ZSH_TMUX_CONFIG = "$HOME/.config/tmux/tmux.conf";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
