local M = {}
local Terminal = require("toggleterm.terminal").Terminal
local term = Terminal:new({
	cmd = "zsh",
	direction = "float",
	autochdir = true,
	hidden = true,
	on_open = function(term)
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-q>", "<cmd>close<cr>", { noremap = true, silent = true })
	end,
})

function M.smart_close(quit)
	print("quit ", quit)
	local bufnr = vim.api.nvim_get_current_buf()
	local buf_windows = vim.call("win_findbuf", bufnr)
	local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
	if modified and #buf_windows == 1 then
		vim.ui.input({
			prompt = "You have unsaved changes. Quit anyway? (y/n) ",
		}, function(input)
			if input == "y" then
				close_or_quit(quit)
			end
		end)
	else
		close_or_quit(quit)
	end
end

function close_or_quit(quit)
	if quit then
		vim.cmd("qa!")
	else
		vim.cmd("q!")
	end
end

function M.toggle_term()
	term:toggle()
end

return M
