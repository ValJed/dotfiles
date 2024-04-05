return {
	{
		"natecraddock/workspaces.nvim",
		opts = {
			open = { "Telescope find_files" },
		},
		config = function()
			local status_ok, telescope = pcall(require, "telescope")
			if not status_ok then
				return
			end

			telescope.load_extension("workspaces")
		end,
	},
}
