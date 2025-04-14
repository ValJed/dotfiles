local util = require("lspconfig.util")
local vue_ts_plugin = os.getenv("VOLAR_LS")
local root_dir = util.root_pattern("package.json")

print(vim.inspect(vue_ts_plugin))
return {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	root_dir = root_dir,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_ts_plugin,
				languages = { "vue" },
			},
		},
	},
}
