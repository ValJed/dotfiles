function Opts(desc)
	local opt = { noremap = true, silent = true }
	if desc then
		opt.desc = desc
	end

	return opt
end

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
