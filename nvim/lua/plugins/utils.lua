function Opts(desc)
	local opt = { noremap = true, silent = true }
	if desc then
		opt.desc = desc
	end

	return opt
end

return {
	{ "tpope/vim-surround" },
	{ "folke/zen-mode.nvim" },
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				snippet_engine = "luasnip",
				placeholders_text = {
					["parameter"] = "any",
				},
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
	{ "ton/vim-bufsurf" },
}
