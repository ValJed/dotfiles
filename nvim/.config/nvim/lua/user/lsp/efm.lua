require("lspconfig").efm.setup({
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = {
				require("efmls-configs.formatters.stylua"),
			},

			rust = {
				require("efmls-configs.formatters.rustfmt"),
			},

			javascript = {
				require("efmls-configs.formatters.eslint_d"),
			},

			vue = {
				require("efmls-configs.formatters.eslint_d"),
			},
		},
	},
})
