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
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = function()
			local flash = require("flash")
			flash.setup()

			--[[ local keymap = vim.api.nvim_set_keymap ]]
			--[[]]
			--[[ keymap({ "n", "x", "o" }, "s", function() ]]
			--[[ 	flash.jump() ]]
			--[[ end, Opts("Flash")) ]]
			--[[ keymap({ "n", "x", "o" }, "S", function() ]]
			--[[ 	flash.treesitter() ]]
			--[[ end, Opts("Flash Treesitter")) ]]
			--[[ keymap("o", "r", function() ]]
			--[[ 	flash.remote() ]]
			--[[ end, Opts("Remote Flash")) ]]
			--[[ keymap({ "o", "x" }, "R", function() ]]
			--[[ 	flash.treesitter_search() ]]
			--[[ end, Opts("Treesitter Search")) ]]
			--[[ keymap("c", "<c-s>", function() ]]
			--[[ 	flash.toggle() ]]
			--[[ end, opts("toggle flash search")) ]]
		end,
	},
}
