return {
	pack = function()
		vim.pack.add({
			"https://github.com/mikavilpas/yazi.nvim",
			{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
		})
	end,
	setup = function()
		vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Yazi<cr>", { desc = "Yazi" })
		vim.keymap.set("n", "<leader>c", "<cmd>Yazi cwd<cr>", { desc = "Yazi Cwd" })
		vim.keymap.set("n", "<leader>t", "<cmd>Yazi toggle<cr>", { desc = "Yazi Toggle" })

		local harpoon = require("harpoon")
		harpoon.setup()

		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-h>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })
			end,
		})
		--[[ return { ]]
		--[[ 	{ ]]
		--[[ 		"mikavilpas/yazi.nvim", ]]
		--[[ 		event = "VeryLazy", ]]
		--[[ 		keys = { ]]
		--[[ 			-- 👇 in this section, choose your own keymappings! ]]
		--[[ 			{ ]]
		--[[ 				"<leader>e", ]]
		--[[ 				mode = { "n", "v" }, ]]
		--[[ 				"<cmd>Yazi<cr>", ]]
		--[[ 				desc = "Yazi", ]]
		--[[ 			}, ]]
		--[[ 			{ ]]
		--[[ 				-- Open in the current working directory ]]
		--[[ 				"<leader>c", ]]
		--[[ 				"<cmd>Yazi cwd<cr>", ]]
		--[[ 				desc = "Yazi Cwd", ]]
		--[[ 			}, ]]
		--[[ 			{ ]]
		--[[ 				"<leader>t", ]]
		--[[ 				"<cmd>Yazi toggle<cr>", ]]
		--[[ 				desc = "Yazi Toggle", ]]
		--[[ 			}, ]]
		--[[ 		}, ]]
		--[[ 	}, ]]
		--[[ } ]]
	end,
}
