return {
	pack = function()
		vim.pack.add({
			"https://github.com/folke/which-key.nvim",
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

		MapGroup("Doc", "<leader>d", "")
		Map("n", "<leader>df", function()
			require("neogen").generate({ type = "func" })
		end, { desc = "Generate function doc" })
		Map("n", "<leader>dc", function()
			require("neogen").generate({ type = "class" })
		end, { desc = "Generate class doc" })
		Map("n", "<leader>dg", function()
			require("neogen").generate()
		end, { desc = "Generate doc" })
	end,
}
