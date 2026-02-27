{pkgs, ...}: {
  imports = [
    ../programs/ci.nix
  ];

  home.packages = [
    # Node
    pkgs.nodejs_25
    pkgs.pnpm_10
    pkgs.bun

    # Rust
    pkgs.pkg-config
    pkgs.rustc
    pkgs.cargo
    pkgs.cargo-watch

    # Gleam
    pkgs.gleam
    pkgs.erlang

    # LSP
    pkgs.rust-analyzer
    pkgs.rustfmt
    pkgs.eslint_d
    pkgs.prettierd
    pkgs.vscode-langservers-extracted
    pkgs.typescript-language-server
    pkgs.stylua
    pkgs.djlint
    pkgs.vtsls
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
    pkgs.typescript
    pkgs.vscode-js-debug
    pkgs.alejandra
    pkgs.tailwindcss-language-server

    # Databases
    # pkgs.lazysql
    # pkgs.rainfrog
    # pkgs.mongosh

    # Tests
    # pkgs.cypress

    # Mobile
    # Removed for now since breaks at build time
    # pkgs.nodePackages.eas-cli
  ];

  home.sessionVariables = {
    TS_LIB = "${pkgs.typescript}/lib/node_modules/typescript/lib";
    VUE_LS = "${pkgs.vue-language-server}/lib/language-tools/packages/language-server";

    # Cypress
    # CYPRESS_INSTALL_BINARY = 0;
    # CYPRESS_RUN_BINARY = "${pkgs.cypress}/bin/Cypress";
  };

  # home.file = {
  #   ".config/slumber/config.yml".source =
  #     config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/slumber/config.yml";
  #   ".config/lazysql/config.toml".source =
  #     config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/lazysql/config.toml";
  # };
}
