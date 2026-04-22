return {
	pack = function()
		vim.pack.add({
			"https://github.com/zbirenbaum/copilot.lua",
			"https://github.com/olimorris/codecompanion.nvim",
		})
	end,
	setup = function()
		require("copilot").setup({})
		require("codecompanion").setup({})

		MapGroup("Copilot", "<leader>C", "󰚩")

		Map("n", "<leader>CC", function()
			vim.cmd("CodeCompanionChat")
		end, { desc = "Chat" })

		Map("v", "<leader>Ce", function()
			vim.cmd("CodeCompanion explain the selected code")
		end, { desc = "Explain Code" })

		Map("v", "<leader>CW", function()
			vim.cmd("CodeCompanion explain the selected error")
		end, { desc = "Explain Error" })

		Map("v", "<leader>Cf", function()
			vim.cmd("CodeCompanion fix the selected code")
		end, { desc = "Fix Code" })

		Map("n", "<leader>Cc", function()
			vim.cmd("CodeCompanion generates commit message for staged code")
		end, { desc = "Generate Commit Message" })
	end,
}
