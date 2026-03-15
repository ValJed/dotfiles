local set_mapping = function()
	local mode = "n"
	local diff = require("git.diff")
	local browse = require("git.browse")

	MapGroup("Git", "<leader>g", "")
	Map(mode, "<leader>gg", function()
		vim.cmd("LazyGit")
	end, { desc = "LazyGit" })
	Map(mode, "<leader>gj", function()
		vim.cmd("Gitsigns next_hunk")
	end, { desc = "Next Hunk" })
	Map(mode, "<leader>gk", function()
		vim.cmd("Gitsigns prev_hunk")
	end, { desc = "Prev Hunk" })
	Map(mode, "<leader>gl", function()
		vim.cmd("Gitsigns blame_line")
	end, { desc = "Blame Line" })
	Map(mode, "<leader>gb", function()
		vim.cmd("GitBlame")
	end, { desc = "Blame" })
	Map(mode, "<leader>gp", function()
		vim.cmd("Gitsigns preview_hunk")
	end, { desc = "Preview Hunk" })
	Map(mode, "<leader>gr", function()
		vim.cmd("Gitsigns reset_hunk")
	end, { desc = "Reset Hunk" })
	Map(mode, "<leader>gR", function()
		vim.cmd("Gitsigns reset_hunk")
	end, { desc = "Reset Buffer" })
	Map(mode, "<leader>gs", function()
		vim.cmd("Gitsigns stage_hunk")
	end, { desc = "Stage Hunk" })
	Map(mode, "<leader>gs", function()
		vim.cmd("Gitsigns stage_hunk")
	end, { desc = "Stage Hunk" })
	Map(mode, "<leader>gu", function()
		vim.cmd("Gitsigns undo_stage_hunk")
	end, { desc = "Undo Stage Hunk" })
	Map(mode, "<leader>go", function()
		vim.cmd("Telescope git_status")
	end, { desc = "Open changed file" })
	Map(mode, "<leader>gB", function()
		vim.cmd("Telescope git_branches")
	end, { desc = "Checkout branch" })
	Map(mode, "<leader>gc", function()
		vim.cmd("Telescope git_commits")
	end, { desc = "Checkout commit" })
	Map(mode, "<leader>gC", function()
		vim.cmd("Telescope git_bcommits")
	end, { desc = "Checkout commit (for current file)" })
	Map(mode, "<leader>gD", function()
		diff.open()
	end, { desc = "Git Diff" })
	Map(mode, "<leader>gD", function()
		diff.close()
	end, { desc = "Git Diff Close" })
	Map(mode, "<leader>gO", function()
		browse.pull_request()
	end, { desc = "Open Pull Request" })
	Map(mode, "<leader>gP", function()
		browse.create_pull_request()
	end, { desc = "Create Pull Request" })
end

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

		set_mapping()

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
	end,
}
