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
	"gleam",
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
			conform.setup({
				formatters_by_ft = {
					nix = { "alejandra" },
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
					javascript = { "eslint_d" },
					jinja = { "djlint" },
					gleam = { "gleam" },
					scss = { "stylelint" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 1000,
					lsp_format = "fallback",
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
