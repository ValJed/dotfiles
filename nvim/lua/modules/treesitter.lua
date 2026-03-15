local parsers = {
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
	"typescript",
	"vim",
	"vue",
	"yaml",
	"graphql",
	"zsh",
}

local function set_keymaps()
	local select = require("nvim-treesitter-textobjects.select")
	local function keymap(mapping, action, desc)
		Map({ "v", "x", "o" }, mapping, function()
			select.select_textobject(action, "textobjects")
		end, { desc = desc })
	end

	keymap("a=", "@assignment.outer", "Outside assignment")
	keymap("i=", "@assignment.inner", "Inside assignment")
	keymap("r=", "@assignment.rhs", "Right side of assignment")
	keymap("a:", "@property.outer", "Outside property")
	keymap("i:", "@property.inner", "Inside property")
	keymap("r:", "@property.rhs", "Right side of property")
	keymap("ap", "@parameter.outer", "Outside parameter")
	keymap("ip", "@parameter.inner", "Inside parameter")
	keymap("ai", "@conditional.outer", "Outside conditional")
	keymap("ii", "@conditional.inner", "Inside conditional")
	keymap("al", "@loop.outer", "Outside loop")
	keymap("il", "@loop.inner", "Inside loop")
	keymap("af", "@call.outer", "Outside function call")
	keymap("if", "@call.inner", "Inside function call")
	keymap("am", "@function.outer", "Outside function definition")
	keymap("im", "@function.inner", "Inside function definition")
	keymap("ac", "@class.outer", "Outside class")
	keymap("ic", "@class.inner", "Inside class")
end

return {
	pack = function()
		vim.pack.add({
			"https://github.com/nvim-treesitter/nvim-treesitter",
			"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		})
	end,
	setup = function()
		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(parsers)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()

		if #parsersToInstall > 0 then
			require("nvim-treesitter").install(parsersToInstall)
		end

		set_keymaps()
	end,
}
