return {
	{ "EdenEast/nightfox.nvim" },
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			local colorscheme = "rose-pine-main"
			vim.cmd("colorscheme default")

			local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

			if not status_ok then
				vim.notify("colorscheme " .. colorscheme .. " not found!")
				return
			end
		end,
	},
}
