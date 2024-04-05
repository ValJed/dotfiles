return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			local harpoon = require("harpoon")
			harpoon.setup()

			vim.inspect(harpoon)
			--[[ harpoon:extend({ ]]
			--[[ 	UI_CREATE = function(cx) ]]
			--[[ 		vim.keymap.set("n", "<C-v>", function() ]]
			--[[ 			harpoon.ui:select_menu_item({ vsplit = true }) ]]
			--[[ 		end, { buffer = cx.bufnr }) ]]
			--[[]]
			--[[ 		vim.keymap.set("n", "<C-b>", function() ]]
			--[[ 			harpoon.ui:select_menu_item({ split = true }) ]]
			--[[ 		end, { buffer = cx.bufnr }) ]]
			--[[ 	end, ]]
			--[[ }) ]]
		end,
	},
}
