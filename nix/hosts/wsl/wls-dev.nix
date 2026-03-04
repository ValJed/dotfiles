{pkgs, ...}: {
  home.packages = [
    # Node
    pkgs.nodejs_22
    pkgs.pnpm_10
    pkgs.bun

    # LSP
    pkgs.vscode-langservers-extracted
    pkgs.typescript-language-server
    pkgs.stylua
    pkgs.stylelint-lsp
    pkgs.emmet-language-server
    pkgs.lua-language-server
    pkgs.bash-language-server
    pkgs.pyright
    pkgs.black
    pkgs.taplo
    pkgs.typescript
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
  };
}
