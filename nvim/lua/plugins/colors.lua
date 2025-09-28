function ReadFile(filepath)
	if vim.fn.filereadable(filepath) == 0 then
		return nil, "File not found or not readable: " .. filepath
	end

	local lines = vim.fn.readfile(filepath, "", 1) -- Read only 1 line
	if #lines > 0 then
		return lines[1]
	else
		return "", "File is empty"
	end
end

return {
	"brenoprata10/nvim-highlight-colors",
	{ "nvim-mini/mini.base16" },
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			local dark_theme = "rose-pine-main"
			local light_theme = "rose-pine-dawn"
			local cur_theme = ReadFile("/etc/theme")
			local colorscheme
			if cur_theme == "light" then
				colorscheme = light_theme
			else
				colorscheme = dark_theme
			end

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
