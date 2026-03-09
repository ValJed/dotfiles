return {
	pack = function()
		vim.pack.add({
			"https://github.com/nvim-lua/plenary.nvim",
			"https://github.com/tpope/vim-surround",
			"https://github.com/folke/zen-mode.nvim",
			"https://github.com/danymat/neogen",
			"https://github.com/numToStr/Navigator.nvim",
			{ src = "https://github.com/saecki/crates.nvim", version = "stable" },
			"https://github.com/ton/vim-bufsurf",
		})
	end,
	setup = function()
		require("neogen").setup({
			snippet_engine = "luasnip",
			placeholders_text = {
				["parameter"] = "any",
			},
		})
		require("Navigator").setup()
		require("crates").setup()
	end,
}
