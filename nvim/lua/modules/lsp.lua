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
	"tailwindcss",
}

return {
	pack = function()
		vim.pack.add({
			"https://github.com/neovim/nvim-lspconfig",
			"https://github.com/stevearc/conform.nvim",
			"https://github.com/nvimdev/lspsaga.nvim",
		})
	end,
	setup = function()
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

		require("lspsaga").setup({
			ui = {
				code_action = "",
			},
			lightbulb = {
				virtual_text = false,
				sign = true,
			},
		})

		local conform = require("conform")
		local util = require("conform.util")

		conform.setup({
			formatters_by_ft = {
				nix = { "alejandra" },
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "biome", "eslint_d", "prettierd" },
				typescript = { "biome", "eslint_d", "prettierd" },
				typescriptreact = { "biome", "eslint_d", "prettierd" },
				json = { "biome" },
				css = { "biome" },
				html = { "prettierd" },
				vue = { "eslint_d", "prettierd" },
				astro = { "eslint_d", "prettierd" },
				gleam = { "gleam" },
				scss = { "biome", "stylelint", "prettierd" },
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
				biome = {
					require_cwd = true,
				},
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

		MapGroup("LSP", "<leader>l", "")
		Map("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
		Map("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
		Map("n", "gp", function()
			vim.cmd("Lspsaga peek_definition")
		end, { desc = "Peek definition" })
		Map("n", "gr", function()
			vim.cmd("Telescope lsp_references")
		end, { desc = "Find references" })
		Map("n", "gs", vim.lsp.buf.hover, { desc = "Signature" })
		Map("n", "gh", function()
			vim.cmd("Lspsaga hover_doc")
		end, { desc = "Hover doc" })
		Map("n", "gj", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
		Map("n", "gk", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

		Map("n", "<leader>lo", function()
			vim.cmd("Lspsaga outline")
		end, { desc = "Outline" })
		Map("n", "<leader>la", function()
			vim.cmd("Lspsaga code_action")
		end, { desc = "Code action" })
		Map("n", "<leader>ld", function()
			vim.diagnostic.open_float({ border = "rounded" })
		end, { desc = "Line diagnostic" })
		Map("n", "<leader>lD", function()
			vim.cmd("Lspsaga show_buf_diagnostics")
		end, { desc = "Buffer diagnostics" })
		Map("n", "<leader>lw", function()
			vim.cmd("Lspsaga show_workspace_diagnostics")
		end, { desc = "Diagnostics" })
		Map("n", "<leader>lR", vim.lsp.buf.references, { desc = "References" })
		Map("n", "<leader>li", function()
			vim.cmd("checkhealth vim.lsp")
		end, { desc = "Info" })
		Map("n", "<leader>ll", vim.lsp.codelens.run, { desc = "CodeLens action" })
		Map("n", "<leader>lr", function()
			vim.cmd("Lspsaga rename")
		end, { desc = "Rename" })
		Map("n", "<leader>ls", function()
			vim.cmd("Telescope lsp_document_symbols")
		end, { desc = "Document symbols" })
		Map("n", "<leader>lf", function()
			vim.cmd("Telescope quickfix")
		end, { desc = "Telescope quickfix" })
	end,
}
