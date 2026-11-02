return {
	pack = function()
		vim.pack.add({
			"https://github.com/MagicDuck/grug-far.nvim",
		})
	end,
	setup = function()
		local grugfar = require("grug-far")
		grugfar.setup({})

		-- local mode = "n"
		-- MapGroup("Org", "<leader>o", "")
		-- Map(mode, "<leader>oc", function()
		-- 	vim.cmd("Org capture")
		-- end, { desc = "Capture" })
		-- Map(mode, "<leader>oa", function()
		-- 	vim.cmd("Org agenda")
		-- end, { desc = "Agenda" })
	end,
}
