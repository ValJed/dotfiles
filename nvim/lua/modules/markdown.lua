return {
	pack = function()
		vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim" })
	end,
	setup = function()
		MapGroup("Markdown", "<leader>M", "")
		Map("n", "<leader>MM", function()
			vim.cmd("Markview toggle")
		end, { desc = "Toggle" })
		Map("n", "<leader>Ms", function()
			vim.cmd("Markview splitToggle")
		end, { desc = "Split" })
	end,
}
