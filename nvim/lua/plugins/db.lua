vim.pack.add({
	"https://github.com/tpope/vim-dadbod",
	"https://github.com/kristijanhusak/vim-dadbod-ui",
	"https://github.com/kristijanhusak/vim-dadbod-completion",
})

vim.api.nvim_create_autocmd("CmdUndefined", {
	pattern = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
	once = true, -- only trigger once, then the real commands take over
	callback = function(ev)
		-- setup completion for sql files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "sql", "plsql" },
			callback = function()
				require("cmp").setup.buffer({
					sources = { { name = "vim-dadbod-completion" } },
				})
			end,
		})

		-- re-run the command that triggered the load
		vim.cmd(ev.match)
	end,
})
