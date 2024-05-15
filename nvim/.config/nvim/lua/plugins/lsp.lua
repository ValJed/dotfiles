local lsp_servers = {
	"jsonls",
	"tsserver",
	"html",
	"emmet_ls",
	"rust_analyzer",
	"volar",
	"tailwindcss",
	"eslint",
	"lua_ls",
	"stylelint_lsp",
}

return {
	{ "creativenull/efmls-configs-nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local handlers = require("lsp.handlers")

			for _, server in pairs(lsp_servers) do
				local opts = {
					on_attach = handlers.on_attach,
					capabilities = handlers.capabilities,
				}

				local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)

				if has_custom_opts then
					opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
				end

				lspconfig[server].setup(opts)
			end

			handlers.setup()

			local eslint_d_formatter = require("efmls-configs.formatters.eslint_d")
			--[[ local prettier_formatter = require("efmls-configs.formatters.prettier") ]]
			lspconfig.efm.setup({
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
							eslint_d_formatter,
							--[[ prettier_formatter, ]]
						},

						vue = {
							eslint_d_formatter,
							--[[ require("efmls-configs.formatters.stylelint"), ]]
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
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = lsp_servers,
				automatic_installation = true,
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = "",
				},
				lightbulb = {
					virtual_text = false,
					sign = true,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
}
