{
  pkgs,
  lib,
  ...
}: {
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
    pkgs.vscode-js-debug
    pkgs.alejandra
    pkgs.tailwindcss-language-server
    pkgs.biome
    # Installed through pnpm
    # pkgs.typescript

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
