{
  neovim-nightly,
  user,
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.stdenv.hostPlatform.system}.default;
    defaultEditor = true;
    extraLuaPackages = luajitPackages: [
      luajitPackages.inspect
    ];
    initLua = ''
      vim.g.db_ui_use_nerd_fonts = 1
      -- mark netrw as loaded so it's not loaded at all.
      vim.g.loaded_netrwPlugin = 1

      require("utils.globals")
      require("options")
      require("keymaps")

      require("utils.functions").load_services("services")
      require("autocmd")
    '';
  };

  home.file = {
    ".config/nvim/lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/dotfiles/nvim/lua";
      recursive = true;
    };
  };

  stylix.targets.neovim.enable = false;
}
