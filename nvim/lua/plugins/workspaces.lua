return {
	pack = function()
		vim.pack.add({
			"https://github.com/natecraddock/workspaces.nvim",
		})
	end,
	setup = function()
		require("workspaces").setup({
			hooks = {
				open = { "Telescope find_files" },
			},
		})

		local status_ok, telescope = pcall(require, "telescope")
		if not status_ok then
			return
		end

		telescope.load_extension("workspaces")
	end,
}
