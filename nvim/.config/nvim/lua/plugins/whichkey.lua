return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			--[[ vim.o.timeout = true ]]
			--[[ vim.o.timeoutlen = 300 ]]
			wk.add({
				{ "<leader>;", ":Alpha<cr>", desc = "Dashboard" },
				{ "<leader>e", ":NvimTreeToggle<cr>", desc = "Explorer" },
				{ "<leader>n", ":Telescope notify<cr>", desc = "Notifications" },
				{ "<leader>c", ":lua require('utils.functions').smart_close()<cr>", desc = "Close" },
				{ "<leader>q", ":lua require('utils.functions').smart_close(true)<cr>", desc = "Quit" },
				{ "<leader>p", ":Lazy profile<cr>", desc = "Plugins" },
				{ "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },

				{ "<leader>f", group = "File" },
				{ "<leader>ff", ":Telescope find_files<cr>", desc = "Find file" },
				{ "<leader>fh", ":Telescope find_files hidden=true<cr>", desc = "Find hidden files" },
				{ "<leader>fg", ":Telescope live_grep<cr>", desc = "Grep" },
				{
					"<leader>fc",
					":lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
					desc = "Color Schemes",
				},
				{ "<leader>ft", ":Telescope help_tags<cr>", desc = "Find Help" },
				{ "<leader>fH", ":Telescope highlights<cr>", desc = "Find highlight groups" },
				{ "<leader>fM", ":Telescope man_pages<cr>", desc = "Man Pages" },
				{ "<leader>fr", ":Telescope oldfiles<cr>", desc = "Open Recent File" },
				{ "<leader>fR", ":Telescope registers<cr>", desc = "Registers" },
				{ "<leader>fk", ":Telescope keymaps<cr>", desc = "Keymaps" },
				{ "<leader>fC", ":Telescope commands<cr>", desc = "Commands" },
				{
					"<leader>fm",
					":lua require('telescope').extensions.marks_nvim.marks_list_buf()<cr>",
					desc = "List Marks",
				}, --[[ list buf ]]
				{
					"<leader>fa",
					":lua require('telescope').extensions.marks_nvim.marks_list_all()<cr>",
					desc = "List All Marks",
				},
				{ "<leader>fw", ":Telescope workspaces<cr>", desc = "Workspaces" },

				{ "<leader>g", group = "Git" },
				{ "<leader>gg", ":LazyGit<cr>", desc = "LazyGit" },
				{ "<leader>gj", ":Gitsigns next_hunk<cr>", desc = "Next Hunk" },
				{ "<leader>gk", ":Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
				{ "<leader>gl", ":Gitsigns blame_line<cr>", desc = "Blame Line" },
				{ "<leader>gb", ":GitBlame<cr>", desc = "Blame" },
				{ "<leader>gp", ":Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
				{ "<leader>gr", ":Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
				{ "<leader>gR", ":Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
				{ "<leader>gs", ":Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
				{ "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
				{ "<leader>go", ":Tlescope git_status<cr>", desc = "Open changed file" },
				{ "<leader>gB", ":Telescope git_branches<cr>", desc = "Checkout branch" },
				{ "<leader>gc", ":Telescope git_commits<cr>", desc = "Checkout commit" },
				{ "<leader>gC", ":Telescope git_bcommits<cr>", desc = "Checkout commit (for current file)" },
				{ "<leader>gd", ":GitDiff<cr>", desc = "Git Diff" },
				{ "<leader>gD", ":lua require('git.diff').close()<cr>", desc = "Git Diff Close" },
				{ "<leader>gP", ":lua require('git.browse').create_pull_request()<cr>", desc = "Pull Request" },

				{ "<leader>l", group = "LSP" },
				{ "<leader>lo", ":Lspsaga outline<cr>", desc = "Outline" },
				{ "<leader>la", ":Lspsaga code_action<cr>", desc = "Code Action" },
				--[[ {"<leader>ld", ":Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostic" }, ]]
				{
					"<leader>ld",
					':lua vim.diagnostic.open_float({ border = "rounded" })<cr>',
					desc = "Line Diagnostic",
				},
				{ "<leader>lD", ":Lspsaga show_buf_diagnostics<cr>", desc = "Buffer Diagnostics" },
				{ "<leader>lp", ":Lspsaga peek_definition<cr>", desc = "Peek Definition" },
				{ "<leader>lw", ":Lspsaga show_workspace_diagnostics<cr>", desc = "Diagnostics" },
				{ "<leader>lh", ":Lspsaga finder<cr>", desc = "Signature" },
				--[[ {"<leader>la", ":lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" }, ]]
				--[[ {"<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" }, ]]
				--[[ {"<leader>lh", ":lua vim.lsp.buf.hover()<cr>", desc = "Signature" }, ]]
				--[[ {"<leader>lr", ":lua vim.lsp.buf.references()<cr>", desc = "References" }, ]]
				{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
				{ "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
				{ "<leader>lj", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
				{ "<leader>lk", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },

				{ "<leader>ll", vim.lsp.codelens.run, desc = "CodeLens Action" },
				{ "<leader>lr", ":Lspsaga rename<cr>", desc = "Rename" },
				{ "<leader>ls", ":Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
				{ "<leader>lf", ":Telescope quickfix<cr>", desc = "Telescope Quickfix" },

				--[[ { "<leader>M", group = "Marks" }, ]]
				--[[ { "<leader>Ma", ":MarksListAll<cr>", desc = "List All" }, ]]
				--[[ { "<leader>Mf", ":MarksListBuf<cr>", desc = "List Buffer" }, ]]

				{ "<leader>d", group = "DB" },
				{ "<leader>dt", "<cmd>DBUIToggle<cr>", desc = "Toggle UI" },
				{ "<leader>db", "<cmd>DBUIFindBuffer<cr>", desc = "Find Buffer" },

				{ "<leader>b", group = "Debug" },
				{ "<leader>bt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
				{ "<leader>bb", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
				{ "<leader>bc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
				{ "<leader>bC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
				{ "<leader>bd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
				{ "<leader>bg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
				{ "<leader>bi", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
				{ "<leader>bo", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
				{ "<leader>bu", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
				{ "<leader>bp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
				{ "<leader>br", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
				{ "<leader>bs", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
				{ "<leader>bq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
				{ "<leader>bU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },

				{ "<leader>s", group = "Split" },
				{ "<leader>sh", ":split<cr>", desc = "Split Horizontally" },
				{ "<leader>sv", ":vsplit<cr>", desc = "Split Vertically" },
				{ "<leader>w", group = "Worspaces" },
				{ "<leader>wa", ":WorkspacesAdd<cr>", desc = "Adds Workspace" },
				{ "<leader>wr", ":WorkspacesRemove<cr>", desc = "Remove Workspace" },
				{ "<leader>wl", ":WorkspacesList<cr>", desc = "List Workspace" },
				{ "<leader>wf", ":Telescope workspaces<cr>", desc = "Find Workspace" },
				{ "<leader>ws", ":Telescope workspacesSyncDirs<cr>", desc = "Find Workspace" },

				{ "<leader>T", group = "Treesitter" },
				{ "<leader>Ti", ":TSConfigInfo<cr>", desc = "Info" },

				-- Harpoon
				{ "<leader>m", ":lua require('harpoon'):list():add()<cr>", desc = "Mark File" },
				{
					"<leader>a",
					":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
					desc = "File Marked",
				},

				{ "<leader>&", ":lua require('harpoon'):list():select(1)<cr>", hidden = true },
				{ "<leader>é", ":lua require('harpoon'):list():select(2)<cr>", hidden = true },
				{ '<leader>"', ":lua require('harpoon'):list():select(3)<cr>", hidden = true },
				{ "<leader>'", ":lua require('harpoon'):list():select(4)<cr>", hidden = true },
				{ "<leader>(", ":lua require('harpoon'):list():select(5)<cr>", hidden = true },
				{ "<leader>-", ":lua require('harpoon'):list():select(6)<cr>", hidden = true },
				{ "<leader>è", ":lua require('harpoon'):list():select(7)<cr>", hidden = true },
				{ "<leader>_", ":lua require('harpoon'):list():select(8)<cr>", hidden = true },
				{ "<leader>ç", ":lua require('harpoon'):list():select(9)<cr>", hidden = true },

				{ "gd", ":lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
				{ "gi", ":lua vim.lsp.buf.implementation()<cr>", desc = "Implementation" },
				{ "gp", ":Lspsaga peek_definition<cr>", desc = "Peek Definition" },
				{ "gr", ":Telescope lsp_references<cr>", desc = "Find References" },
				{ "gs", ":lua vim.lsp.buf.hover()<cr>", desc = "Signature" },
				{ "gh", ":Lspsaga hover_doc<cr>", desc = "Hover Doc" },
			})

			wk.setup({
				preset = "helix",
			})
		end,
	},
}
