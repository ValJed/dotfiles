return {
	pack = function()
		vim.pack.add({
			"https://github.com/nvim-telescope/telescope.nvim",
			"https://github.com/nvim-telescope/telescope-ui-select.nvim",
		})
	end,
	setup = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local state = require("telescope.actions.state")

		local commits_picker_config = {
			mappings = {
				i = {
					["<C-y>"] = function()
						local entry = state.get_selected_entry()
						for key, value in pairs(entry) do
							if key == "value" then
								vim.fn.setreg("+", value)
							end
						end
					end,
				},
			},
		}

		telescope.setup({
			defaults = {

				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				file_ignore_patterns = { "node_modules" },

				mappings = {
					i = {
						["<C-c>"] = actions.close,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,

						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["K"] = actions.preview_scrolling_up,
						["J"] = actions.preview_scrolling_down,
						["<C-u>"] = actions.results_scrolling_up,
						["<C-d>"] = actions.results_scrolling_down,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
					},

					n = {
						["<esc>"] = actions.close,
						["<C-c>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["G"] = actions.move_to_bottom,

						["K"] = actions.preview_scrolling_up,
						["J"] = actions.preview_scrolling_down,
						["<C-u>"] = actions.results_scrolling_up,
						["<C-d>"] = actions.results_scrolling_down,

						["?"] = actions.which_key,
					},
				},
			},

			pickers = {
				git_branches = {
					mappings = {
						i = { ["<cr>"] = actions.git_switch_branch },
					},
				},
				git_commits = commits_picker_config,
				git_bcommits = commits_picker_config,
			},
		})

		telescope.load_extension("ui-select")

		local mode = "n"
		MapGroup("Find", "<leader>f", "")
		Map(mode, "<leader>fs", function()
			vim.cmd("Telescope live_grep_string")
		end, { desc = "Grep string" })
		Map(mode, "<leader>fc", function()
			require("telescope.builtin").colorscheme({ enable_preview = true })
		end, { desc = "Color schemes" })
		Map(mode, "<leader>ff", function()
			vim.cmd("Telescope find_files")
		end, { desc = "Find file" })
		Map(mode, "<leader>fh", function()
			vim.cmd("Telescope find_files hidden=true")
		end, { desc = "Find hidden files" })
		Map(mode, "<leader>fg", function()
			vim.cmd("Telescope live_grep")
		end, { desc = "Grep" })
		Map(mode, "<leader>ft", function()
			vim.cmd("Telescope help_tags")
		end, { desc = "Find help" })
		Map(mode, "<leader>fH", function()
			vim.cmd("Telescope highlights")
		end, { desc = "Find highlight groups" })
		Map(mode, "<leader>fM", function()
			vim.cmd("Telescope man_pages")
		end, { desc = "Man pages" })
		Map(mode, "<leader>fr", function()
			vim.cmd("Telescope oldfiles")
		end, { desc = "Open recent file" })
		Map(mode, "<leader>fR", function()
			vim.cmd("Telescope registers")
		end, { desc = "Registers" })
		Map(mode, "<leader>fk", function()
			vim.cmd("Telescope keymaps")
		end, { desc = "Keymaps" })
		Map(mode, "<leader>fC", function()
			vim.cmd("Telescope commands")
		end, { desc = "Commands" })
		Map(mode, "<leader>fm", function()
			telescope.extensions.marks_nvim.marks_list_buf()
		end, { desc = "List marks (buffer)", icon = "" })
		Map(mode, "<leader>fb", function()
			telescope.extensions.marks_nvim.bookmarks_list_all()
		end, { desc = "List bookmarks", icon = "" })
		Map(mode, "<leader>fa", function()
			telescope.extensions.marks_nvim.marks_list_all()
		end, { desc = "List all marks" })
	end,
}
