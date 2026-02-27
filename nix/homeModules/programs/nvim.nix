{
  neovim-nightly,
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
      require("options")
      require("keymaps")

      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not vim.loop.fs_stat(lazypath) then
      	vim.fn.system({
      		"git",
      		"clone",
      		"--filter=blob:none",
      		"https://github.com/folke/lazy.nvim.git",
      		"--branch=stable", -- latest stable release
      		lazypath,
      	})
      end

      vim.opt.rtp:prepend(lazypath)

      require("lazy").setup("plugins", {
      	dev = {
      		path = "~/workspace/projects",
      	},
      })

      require("autocmd")
    '';
  };

  home.file = {
    ".config/nvim/lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/jed/dotfiles/nvim/lua";
      recursive = true;
    };
  };

  stylix.targets.neovim.enable = false;
}
