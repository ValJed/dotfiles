local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"astro",
		"bash",
		"css",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"rust",
		"scss",
		"sql",
		"tsx",
		"vim",
		"vue",
		"yaml",
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>", -- set to `false` to disable one of the mappings
			node_incremental = "<C-space>",
			scope_incremental = "<C-s>",
			node_decremental = "<bs>",
		},
	},
})
