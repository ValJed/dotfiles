local lsp_servers = {
	"jsonls",
	"ts_ls",
	"html",
	"emmet_language_server",
	"stylelint_lsp",
	"rust_analyzer",
	--[[ "vtsls", ]]
	"vue_ls",
	"eslint",
	"lua_ls",
	"bashls",
	"nil_ls",
	"gleam",
	"astro",
	"pyright",
}

return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local handlers = require("lsp.handlers")

			for _, server in pairs(lsp_servers) do
				local opts = {
					capabilities = handlers.capabilities,
				}

				local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
				if has_custom_opts then
					opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
				end

				vim.lsp.config[server] = opts
				vim.lsp.enable(server)
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
					typescript = { "eslint_d", "prettierd" },
					html = { "prettierd" },
					vue = { "eslint_d", "prettierd" },
					astro = { "eslint_d", "prettierd" },
					--[[ jinja = { "djlint" }, ]]
					gleam = { "gleam" },
					scss = { "stylelint", "prettierd" },
					python = { "black" },
					toml = { "taplo" },
					--[[ yaml = function(bufnr) ]]
					--[[ 	local filepath = vim.api.nvim_buf_get_name(bufnr) ]]
					--[[ 	-- Only format YAML files in .github/workflows/ ]]
					--[[ 	if filepath:match("%.github/workflows/") then ]]
					--[[ 		return { "actionlint", "prettierd" } ]]
					--[[ 	end ]]
					--[[ 	return { "prettierd" } ]]
					--[[ end, ]]
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
