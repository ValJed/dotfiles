local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},

		javascript = {
			require("formatter.filetypes.javascript").eslint_d,
		},

		vue = {
			require("formatter.filetypes.javascript").eslint_d,
		},

		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
