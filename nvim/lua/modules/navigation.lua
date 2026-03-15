return {
	pack = function()
		vim.pack.add({
			"https://github.com/mikavilpas/yazi.nvim",
			{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
			"https://github.com/natecraddock/workspaces.nvim",
		})
	end,
	setup = function()
		local harpoon = require("harpoon")
		local workspaces = require("workspaces")
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

		workspaces.setup({
			hooks = {
				open = { "Telescope find_files" },
			},
		})

		local status_ok, telescope = pcall(require, "telescope")
		if status_ok then
			telescope.load_extension("workspaces")
		end

		local mode = "n"
		--[[ Yazi ]]
		Map(mode, "<leader>e", function()
			vim.cmd("Yazi")
		end, { desc = "Yazi", icon = "" })
		Map(mode, "<leader>c", function()
			vim.cmd("Yazi cwd")
		end, { desc = "Yazi Cwd", icon = "" })
		Map(mode, "<leader>t", function()
			vim.cmd("Yazi toggle")
		end, { desc = "Yazi Toggle", icon = "" })

		--[[ Workspaces ]]
		MapGroup("Workspaces", "<leader>w", "")
		Map(mode, "<leader>fw", function()
			vim.cmd("Telescope workspaces")
		end, { desc = "Workspaces" })
		Map(mode, "<leader>wa", function()
			vim.cmd("WorkspacesAdd")
		end, { desc = "Add workspace" })
		Map(mode, "<leader>wr", function()
			vim.cmd("WorkspacesRemove")
		end, { desc = "Remove workspace" })
		Map(mode, "<leader>wl", function()
			vim.cmd("WorkspacesList")
		end, { desc = "List workspaces" })
		Map(mode, "<leader>wf", function()
			vim.cmd("Telescope workspaces")
		end, { desc = "Find workspace" })
		Map(mode, "<leader>ws", function()
			vim.cmd("WorkspacesSyncDirs")
		end, { desc = "Sync workspace dirs" })

		--[[ Harpoon ]]
		local wk = require("which-key")
		Map(mode, "<leader>m", function()
			harpoon:list():add()
		end, { desc = "Mark File", icon = "" })
		Map(mode, "<leader>a", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Files Marked", icon = "" })
		for i = 1, 9 do
			Map(mode, "<leader>" .. i, function()
				harpoon:list():select(i)
			end)
			wk.add({ { "<leader>" .. i, hidden = true } })
		end
	end,
}
