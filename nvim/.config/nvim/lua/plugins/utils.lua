return {
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	},
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	{ "github/copilot.vim" },
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
}
