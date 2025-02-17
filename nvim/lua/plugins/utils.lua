function Opts(desc)
	local opt = { noremap = true, silent = true }
	if desc then
		opt.desc = desc
	end

	return opt
end

return {
	{ "folke/zen-mode.nvim" },
	{
		"danymat/neogen",
		dev = true,
		config = function()
			require("neogen").setup({
				snippet_engine = "luasnip",
			})
		end,
		-- Uncomment next line if you want to follow only stable versions
		-- tag = "*"
	},
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
