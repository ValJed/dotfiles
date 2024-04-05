function GetTmuxCommand(set_default)
	if set_default then
		return "!tmux set-window-option automatic-rename"
	end

	local cur_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	return "!tmux rename-window " .. cur_dir
end

-- Format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
--[[ vim.cmd("WorkspacesSyncDir") ]]
vim.api.nvim_exec([[ autocmd DirChanged * silent execute luaeval("GetTmuxCommand()") ]], false)
vim.api.nvim_exec([[ autocmd ExitPre * silent execute luaeval("GetTmuxCommand(true)") ]], false)
