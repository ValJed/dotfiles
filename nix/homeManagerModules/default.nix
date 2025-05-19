{
  pkgs,
  inputs,
  lib,
  config,
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
  record = import ./scripts/record.nix {inherit pkgs;};
in {
  imports = [
    ./programs/btop.nix
    ./programs/firefox.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/gtk.nix
    ./programs/kitty.nix
    ./programs/nvim.nix
    ./programs/pass.nix
    ./programs/tmux.nix
    ./programs/virt.nix
    ./programs/zsh.nix
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
    record

    # Desktop
    pkgs.dconf-editor
    pkgs.wbg
    pkgs.adwaita-qt
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    # Tools
    pkgs.lazygit
    pkgs.lazydocker
    pkgs.eza
    pkgs.bat
    pkgs.zoxide
    pkgs.yazi
    pkgs.starship
    pkgs.ripgrep
    pkgs.tokei
    pkgs.tealdeer
    pkgs.fastfetch
    pkgs.bc
    pkgs.dysk
    # pkgs.nodePackages.eas-cli Removed for now since breaks at build time

    # Apps
    pkgs.discord
    pkgs.slack
    pkgs.obsidian
    pkgs.spotify
    pkgs.slumber

    # LSP
    pkgs.rust-analyzer
    pkgs.rustfmt
    pkgs.eslint_d
    pkgs.prettierd
    pkgs.vscode-langservers-extracted
    pkgs.typescript-language-server
    pkgs.stylua
    pkgs.djlint
    pkgs.vue-language-server
    pkgs.stylelint-lsp
    pkgs.nil
    pkgs.emmet-language-server
    pkgs.lua-language-server
    pkgs.bash-language-server
    pkgs.astro-language-server
    pkgs.black
  ];

  wayland.windowManager.hyprland.systemd.enable = false;
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
      source = config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/nvim";
      recursive = true;
    };
    ".config/slumber/config.yml".source = config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/slumber/config.yml";
    ".config/rofi/config.rasi".source = ../../rofi/config.rasi;
    ".config/swappy/config".source = ../../swappy/config;
    ".config/dunst/dunstrc".source = ../../dunst/dunstrc;
    ".config/yazi" = {
      source = ../../yazi;
      recursive = true;
    };
    ".config/qutebrowser" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/qutebrowser";
      recursive = true;
    };
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
    VOLAR_LS = "${pkgs.vue-language-server}/lib/node_modules/@vue/language-server";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
