function Opts(desc)
	local opt = { noremap = true, silent = true }
	if desc then
		opt.desc = desc
	end

	return opt
end

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/tpope/vim-surround",
	"https://github.com/folke/zen-mode.nvim",
	"https://github.com/danymat/neogen",
	"https://github.com/numToStr/Navigator.nvim",
	{ src = "https://github.com/saecki/crates.nvim", version = "stable" },
	"https://github.com/ton/vim-bufsurf",
})

require("neogen").setup({
	snippet_engine = "luasnip",
	placeholders_text = {
		["parameter"] = "any",
	},
})
require("Navigator").setup()
require("crates").setup()
