{
  pkgs,
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
    ./programs/bat.nix
    ./programs/btop.nix
    ./programs/dunst.nix
    ./programs/firefox.nix
    ./programs/fzf.nix
    ./programs/ci.nix
    ./programs/git.nix
    ./programs/gtk.nix
    ./programs/kitty.nix
    ./programs/nvim.nix
    ./programs/pass.nix
    ./programs/rofi.nix
    ./programs/tmux.nix
    ./programs/virt.nix
    ./programs/waybar.nix
    ./programs/yazi.nix
    ./programs/zsh.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jed";
  home.homeDirectory = "/home/jed";

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
    pkgs.rose-pine-hyprcursor

    # Tools
    pkgs.lazygit
    pkgs.lazydocker
    pkgs.lazysql
    pkgs.rainfrog
    pkgs.vi-mongo
    pkgs.eza
    pkgs.fd
    pkgs.zoxide
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
    pkgs.qutebrowser
    pkgs.presenterm

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
    pkgs.pyright
    pkgs.black
    pkgs.taplo
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
    ".local/share/zsh/vendor-completions".source = pkgs.runCommand "zsh-completions" {} ''
      mkdir -p $out
      for pkg in ${lib.concatStringsSep " " (map toString config.home.packages)}; do
        # Copy from site-functions
        if [[ -d "$pkg/share/zsh/site-functions" ]]; then
          cp -L "$pkg/share/zsh/site-functions/"_* $out/ 2>/dev/null || true
        fi

        # Copy from vendor-completions
        if [[ -d "$pkg/share/zsh/vendor-completions" ]]; then
          cp -L "$pkg/share/zsh/vendor-completions/"_* $out/ 2>/dev/null || true
        fi
      done
    '';
    ".local/share/zsh/completions" = {
      source = ../../zsh/completions;
      recursive = true;
    };
    ".config/hypr/hyprlock.conf".source = ../../hypr/hyprlock.conf;
    ".config/zsh" = {
      source = ../../zsh;
      recursive = true;
    };
    ".config/starship.toml".source = ../../starship/starship.toml;
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/nvim";
      recursive = true;
    };
    ".config/slumber/config.yml".source =
      config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/slumber/config.yml";
    ".config/swappy/config".source = ../../swappy/config;
    ".config/yazi" = {
      source = ../../yazi;
      recursive = true;
    };
    ".config/qutebrowser" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/qutebrowser";
      recursive = true;
    };
    ".config/tridactyl" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/tridactyl";
      recursive = true;
    };
    ".config/lazysql/config.toml".source =
      config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/lazysql/config.toml";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    ZSH_TMUX_CONFIG = "$HOME/.config/tmux/tmux.conf";
    TS_LIB = "${pkgs.typescript}/lib/node_modules/typescript/lib";
    VOLAR_LS = "${pkgs.vue-language-server}/lib/language-tools/packages/language-server";
  };

  # programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
