return {
	pack = function()
		vim.pack.add({
			"https://github.com/brenoprata10/nvim-highlight-colors",
			"https://github.com/nvim-mini/mini.base16",
			{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
			"https://github.com/rose-pine/neovim",
			"https://github.com/nvim-highlight-colors",
		})
	end,

	setup = function()
		require("nvim-highlight-colors").setup({})
		require("utils.functions").set_colorscheme()
	end,
}
