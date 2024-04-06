return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "plsql" } },
			{ "tpope/vim-dadbod" },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
