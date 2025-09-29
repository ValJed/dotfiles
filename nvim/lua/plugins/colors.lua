return {
	"brenoprata10/nvim-highlight-colors",
	{ "nvim-mini/mini.base16" },
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("utils.functions").set_colorscheme()
		end,
	},
	config = function()
		require("nvim-highlight-colors").setup()
	end,
}
