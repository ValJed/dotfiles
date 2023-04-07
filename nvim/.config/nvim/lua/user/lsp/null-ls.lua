local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local prettierd = formatting.prettierd.with({
	condition = function(utils)
		return utils.root_has_file({
			".prettierrc",
			".prettierrc.yml",
			".prettierrc.yaml",
			".prettierrc.json",
			".prettierrc.toml",
		})
	end,
})

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.eslint_d,
		diagnostics.stylelint,

		prettierd,
		formatting.eslint_d,
		formatting.stylelint,
		formatting.stylua,
		formatting.djlint,
		formatting.rustfmt,
	},
})
