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
			vim.cmd("CodeCompanion")
		end, { desc = "Chat" })
		Map("v", "<leader>Ce", function()
			vim.cmd("CodeCompanionExplain")
		end, { desc = "Explain Selection" })
		Map("v", "<leader>Cf", function()
			vim.cmd("CodeCompanionFix")
		end, { desc = "Fix Selection" })
		Map("n", "<leader>Cc", function()
			vim.cmd("CodeCompanionCommit")
		end, { desc = "Generate Commit Message" })
		Map("n", "<leader>CS", function()
			vim.cmd("CodeCompanionCommitStaged")
		end, { desc = "Generate Commit Message for Staged" })
		Map("n", "<leader>CR", function()
			vim.cmd("CodeCompanionReset")
		end, { desc = "Reset Chat" })
		Map("n", "<leader>CD", function()
			vim.cmd("CodeCompanionDebugInfo")
		end, { desc = "Debug Info" })
	end,
}
