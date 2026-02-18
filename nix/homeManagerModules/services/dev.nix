{pkgs, ...}: {
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

    # Tests
    pkgs.cypress
  ];
}
