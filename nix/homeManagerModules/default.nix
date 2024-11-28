{
  pkgs,
  inputs,
  lib,
  ...
}: let
  act-update = import ./scripts/act-update.nix {inherit pkgs;};
  task = import ./scripts/task.nix {
    inherit pkgs;
    inherit lib;
  };
  tomato = import ./scripts/tomato.nix {
    inherit pkgs;
    inherit lib;
  };
in {
  imports = [
    ./programs/zsh.nix
    ./programs/tmux.nix
    ./programs/kitty.nix
    ./programs/gtk.nix
    ./programs/nvim.nix
    ./programs/firefox.nix
    ./programs/git.nix
    ./programs/btop.nix
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
    act-update
    task
    tomato

    pkgs.dconf-editor
    pkgs.wbg
    pkgs.adwaita-qt
    pkgs.lazygit
    pkgs.lazydocker
    pkgs.eza
    pkgs.bat
    pkgs.fzf
    pkgs.zoxide
    pkgs.yazi
    pkgs.pass
    pkgs.starship
    pkgs.ripgrep
    pkgs.tokei
    pkgs.tealdeer
    pkgs.fastfetch
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    # Apps
    pkgs.discord
    pkgs.slack
    pkgs.obsidian
    pkgs.spotify

    # LSP
    pkgs.rust-analyzer
    pkgs.rustfmt
    pkgs.eslint_d
    pkgs.efm-langserver
    pkgs.vscode-langservers-extracted
    pkgs.typescript-language-server
    pkgs.stylua
    pkgs.djlint
    pkgs.vue-language-server
    pkgs.stylelint-lsp
    pkgs.nil
    pkgs.emmet-language-server

    # Work
    pkgs.cypress
  ];

  xdg.desktopEntries.obsidian = {
    name = "Obsidian";
    type = "Application";
    exec = "obsidian --disable-gpu %u";
    icon = "obsidian";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprlock.conf".source = ../../hypr/hyprlock.conf;
    ".config/zsh" = {
      source = ../../zsh;
      recursive = true;
    };
    ".config/starship.toml".source = ../../starship/starship.toml;
    ".config/waybar" = {
      source = ../../waybar;
      recursive = true;
    };
    ".config/nvim" = {
      source = ../../nvim;
      recursive = true;
    };
    ".config/rofi/config.rasi".source = ../../rofi/config.rasi;
    ".config/swappy/config".source = ../../swappy/config;
    ".config/dunst/dunstrc".source = ../../dunst/dunstrc;

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
    TS_LIB = "${pkgs.typescript}/lib/node_modules/typescript/lib";
    CYPRESS_INSTALL_BINARY = 0;
    CYPRESS_RUN_BINARY = "${pkgs.cypress}/bin/Cypress";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
