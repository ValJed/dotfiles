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
	"gleam",
	"astro",
}

return {
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
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			local util = require("conform.util")

			conform.setup({
				formatters_by_ft = {
					nix = { "alejandra" },
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
					javascript = { "eslint_d", "prettierd" },
					vue = { "eslint_d", "prettierd" },
					astro = { "eslint_d", "prettierd" },
					jinja = { "djlint" },
					gleam = { "gleam" },
					scss = { "stylelint", "prettierd" },
				},
				format_on_save = true,
				formatters = {
					prettierd = {
						require_cwd = true,
					},
					eslint_d = {
						cwd = util.root_file({
							".eslintrc",
							".eslintrc.json",
							".eslintrc.js",
							".eslintrc.yml",
							".eslintrc.yaml",
							"eslint.config.js",
						}),
						require_cwd = true,
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
