local lsp_servers = {
	"jsonls",
	"ts_ls",
	"html",
	"emmet_language_server",
	"stylelint_lsp",
	"rust_analyzer",
	"volar",
	"eslint",
	"lua_ls",
	"bashls",
	"nil_ls",
	"efm",
}

return {
	{ "creativenull/efmls-configs-nvim" },
	{ "gleam-lang/gleam.vim" },
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

			--[[ local fs = require("efmls-configs.fs") ]]
			--[[ local formatter = "stylelint" ]]
			--[[ local args = "--fix '${FILENAME}'" ]]
			--[[ local command = string.format("%s %s", fs.executable(formatter, fs.Scope.NODE), args) ]]
			--[[ vim.notify(command) ]]
			--[[]]
			--[[ local stylelint_formatter = { ]]
			--[[ 	formatCommand = command, ]]
			--[[ 	formatStdin = false, ]]
			--[[ 	rootMarkers = { ".stylelintrc", ".stylelintrc.json", ".stylelintrc.yml", ".stylelintrc.yaml" }, ]]
			--[[ } ]]

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
							--[[ stylelint_formatter, ]]
							--[[ require("efmls-configs.formatters.stylelint"), ]]
							--[[ require("efmls-configs.formatters.prettier"), ]]
						},

						jinja = {
							require("efmls-configs.formatters.djlint"),
						},

						css = {
							--[[ stylelint_formatter, ]]
						},

						scss = {
							--[[ stylelint_formatter, ]]
						},

						nix = {
							require("efmls-configs.formatters.alejandra"),
						},
					},
				},
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
