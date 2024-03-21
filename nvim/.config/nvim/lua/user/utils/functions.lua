local M = {}

local close_or_quit = function(quit)
	if quit then
		vim.cmd("qa!")
	else
		vim.cmd("q!")
	end
end

function M.smart_close(quit)
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

function M.replace_from_register()
	local cmd = '"_d"' .. vim.v.register .. "p"
	vim.cmd("normal! " .. cmd)
end

return M
