local M = {}

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

local close_or_quit = function(quit)
	if quit then
		vim.cmd("qa!")
	else
		vim.cmd("q!")
	end
end

function M.set_colorscheme()
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
