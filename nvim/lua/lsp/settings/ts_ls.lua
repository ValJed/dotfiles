local vue_ls = os.getenv("VUE_LS")
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_ls,
	languages = { "vue" },
	configNamespace = "typescript",
}

return {
	root_markers = { "package.json" },
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
		plugins = { vue_plugin },
	},
	filetypes = tsserver_filetypes,
}
