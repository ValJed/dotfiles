require("notify").setup({
	background_colour = "NotifyBackground",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 2,
	minimum_width = 40,
	render = "compact",
	stages = "fade_in_slide_out",
	timeout = 1000,
	top_down = true,
})

vim.notify = require("notify")

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.load_extension("notify")
