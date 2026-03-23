{...}: let
  pkgs = import (builtins.fetchGit {
    # Descriptive name to make the store path easier to identify
    name = "typescript";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "67b4bf1df4ae54d6866d78ccbd1ac7e8a8db8b73";
  }) {};

  typescript = pkgs.typescript;
in {
  home.packages = [
    # Node
    pkgs.nodejs_22
    pkgs.pnpm_10
    pkgs.bun

    # LSP
    pkgs.tree-sitter
    pkgs.vscode-langservers-extracted
    pkgs.typescript-language-server
    pkgs.vue-language-server
    pkgs.stylua
    pkgs.stylelint-lsp
    pkgs.emmet-language-server
    pkgs.lua-language-server
    pkgs.bash-language-server
    pkgs.pyright
    pkgs.black
    pkgs.taplo
    typescript
    pkgs.vscode-js-debug
    pkgs.alejandra
    pkgs.tailwindcss-language-server
    pkgs.biome

    # Databases
    # pkgs.lazysql
    # pkgs.rainfrog
    # pkgs.mongosh
  ];

  home.sessionVariables = {
    TS_LIB = "${pkgs.typescript}/lib/node_modules/typescript/lib";
    VUE_LS = "${pkgs.vue-language-server}/lib/language-tools/packages/language-server";
  };
}
