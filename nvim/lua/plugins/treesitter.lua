return {
	{ "Glench/Vim-Jinja2-Syntax" },
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
		},
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"astro",
					"bash",
					"css",
					"gleam",
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
					"typescript",
				}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
				sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
				ignore_install = { "" }, -- List of parsers to ignore installing
				autopairs = {
					enable = true,
				},
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = function(lang, bufnr)
						return vim.api.nvim_buf_line_count(bufnr) > 50000
					end,
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
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
							["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
							["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
							["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

							-- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
							["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
							["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
							["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
							["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

							["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
							["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

							["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
							["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

							["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

							["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
							["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

							["am"] = {
								query = "@function.outer",
								desc = "Select outer part of a method/function definition",
							},
							["im"] = {
								query = "@function.inner",
								desc = "Select inner part of a method/function definition",
							},

							["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
						},
					},
				},
			})
		end,
	},
}
