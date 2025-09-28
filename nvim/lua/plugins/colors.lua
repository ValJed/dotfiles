return {
	{ "nvim-mini/mini.base16" },
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup()
	end,
}
