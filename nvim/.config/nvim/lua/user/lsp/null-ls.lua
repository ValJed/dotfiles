local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local prettierConfig = {
	condition = function(utils)
		return utils.root_has_file({
			".prettierrc",
			".prettierrc.js",
			".prettierrc.yml",
			".prettierrc.yaml",
			".prettierrc.json",
			".prettierrc.toml",
		})
	end,
}

local eslintConfig = {
	condition = function(utils)
		return utils.root_has_file({
			".eslintrc",
			".eslintrc.js",
			".eslintrc.json",
		})
	end,
}

local stylelintConfig = {
	filetypes = { "sass", "scss", "css", "less", "vue" },
}

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.eslint_d.with(eslintConfig),
		diagnostics.stylelint.with(stylelintConfig),

		formatting.prettierd.with(prettierConfig),
		formatting.eslint_d.with(eslintConfig),
		formatting.stylelint.with(stylelintConfig),
		formatting.stylua,
		formatting.djlint,
		formatting.rustfmt,
	},
})
