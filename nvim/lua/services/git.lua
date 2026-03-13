return {
	pack = function()
		vim.pack.add({
			"https://github.com/dinhhuy258/git.nvim",
			"https://github.com/kdheepak/lazygit.nvim",
			"https://github.com/lewis6991/gitsigns.nvim",
		})
	end,
	setup = function()
		require("git").setup({ default_mappings = false })
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})

		local mode = "n"

		Map(mode, "<leader>gg", ":LazyGit<cr>", { desc = "LazyGit" })
		Map(mode, "<leader>gj", ":Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
		Map(mode, "<leader>gk", ":Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
		Map(mode, "<leader>gl", ":Gitsigns blame_line<cr>", { desc = "Blame Line" })
		Map(mode, "<leader>gb", ":GitBlame<cr>", { desc = "Blame" })
		Map(mode, "<leader>gp", ":Gitsigns preview_hunk<cr>", { desc = "Preview Hunk" })
		Map(mode, "<leader>gr", ":Gitsigns reset_hunk<cr>", { desc = "Reset Hunk" })
		Map(mode, "<leader>gR", ":Gitsigns reset_buffer<cr>", { desc = "Reset Buffer" })
		Map(mode, "<leader>gs", ":Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
		Map(mode, "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", { desc = "Undo Stage Hunk" })
		Map(mode, "<leader>go", ":Telescope git_status<cr>", { desc = "Open changed file" })
		Map(mode, "<leader>gB", ":Telescope git_branches<cr>", { desc = "Checkout branch" })
		Map(mode, "<leader>gc", ":Telescope git_commits<cr>", { desc = "Checkout commit" })
		Map(mode, "<leader>gC", ":Telescope git_bcommits<cr>", { desc = "Checkout commit (for current file)" })
		Map(mode, "<leader>gD", ":lua require('git.diff').open()<cr>", { desc = "Git Diff" })
		Map(mode, "<leader>gD", ":lua require('git.diff').close()<cr>", { desc = "Git Diff Close" })
		Map(mode, "<leader>gO", ":lua require('git.browse').pull_request()<cr>", { desc = "Open Pull Request" })
		Map(
			mode,
			"<leader>gP",
			":lua require('git.browse').create_pull_request()<cr>",
			{ desc = "Create Pull Request" }
		)
	end,
}
