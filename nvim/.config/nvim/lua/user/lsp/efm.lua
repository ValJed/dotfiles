require("lspconfig").efm.setup({
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = {
				--[[ require("efmls-configs.linters.luacheck"), ]]
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
				require("efmls-configs.formatters.stylelint"),
				--[[ require("efmls-configs.formatters.prettier"), ]]
			},

			css = {
				require("efmls-configs.formatters.stylelint"),
			},

			scss = {
				require("efmls-configs.formatters.stylelint"),
			},
		},
	},
})
