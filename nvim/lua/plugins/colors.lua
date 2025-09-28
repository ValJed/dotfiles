return {
	"brenoprata10/nvim-highlight-colors",
	{ "nvim-mini/mini.base16" },
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			local colorscheme = "rose-pine-main"
			local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
			if not status_ok then
				vim.notify("colorscheme " .. " not found!")
				return
			end
		end,
	},
	config = function()
		require("nvim-highlight-colors").setup()
	end,
}
