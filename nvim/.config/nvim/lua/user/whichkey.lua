local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 300

wk.register({
	["&"] = "which_key_ignore",
	["é"] = "which_key_ignore",
	['"'] = "which_key_ignore",
	["'"] = "which_key_ignore",
	["("] = "which_key_ignore",
	["-"] = "which_key_ignore",

	[";"] = { ":Alpha<cr>", "Dashboard" },
	["e"] = { ":NvimTreeToggle<cr>", "Explorer" },
	["m"] = { ":lua require('harpoon.mark').add_file()<cr>", "Mark File" },
	["n"] = { ":Telescope notify<cr>", "Notifications" },
	["a"] = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Show Marked Files" },
	["c"] = { ":lua require('user.utils.functions').smart_close()<cr>", "Close" },
	["q"] = { ":lua require('user.utils.functions').smart_close(true)<cr>", "Quit" },
	["p"] = { ":Lazy profile<cr>", "Plugins" },
	["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },

	f = {
		name = "Find",
		f = { ":Telescope find_files<cr>", "Find file" },
		h = { ":Telescope find_files hidden=true<cr>", "Find hidden files" },
		g = { ":Telescope live_grep<cr>", "Grep" },
		c = {
			":lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
			"Color Schemes",
		},
		t = { ":Telescope help_tags<cr>", "Find Help" },
		H = { ":Telescope highlights<cr>", "Find highlight groups" },
		M = { ":Telescope man_pages<cr>", "Man Pages" },
		r = { ":Telescope oldfiles<cr>", "Open Recent File" },
		R = { ":Telescope registers<cr>", "Registers" },
		k = { ":Telescope keymaps<cr>", "Keymaps" },
		C = { ":Telescope commands<cr>", "Commands" },
		m = { ":Telescope marks<cr>", "Marks" },
		w = { ":Telescope workspaces<cr>", "Workspaces" },
	},
	g = {
		name = "Git",
		g = { ":LazyGit<cr>", "LazyGit" },
		j = { ":Gitsigns next_hunk<cr>", "Next Hunk" },
		k = { ":Gitsigns prev_hunk<cr>", "Prev Hunk" },
		l = { ":Gitsigns blame_line<cr>", "Blame Line" },
		b = { ":GitBlame<cr>", "Blame" },
		p = { ":Gitsigns preview_hunk<cr>", "Preview Hunk" },
		r = { ":Gitsigns reset_hunk<cr>", "Reset Hunk" },
		R = { ":Gitsigns reset_buffer<cr>", "Reset Buffer" },
		s = { ":Gitsigns stage_hunk<cr>", "Stage Hunk" },
		u = {
			":Gitsigns undo_stage_hunk<cr>",
			"Undo Stage Hunk",
		},
		o = { ":Tlescope git_status<cr>", "Open changed file" },
		B = { ":Telescope git_branches<cr>", "Checkout branch" },
		c = { ":Telescope git_commits<cr>", "Checkout commit" },
		C = {
			":Telescope git_bcommits<cr>",
			"Checkout commit (for current file)",
		},
		d = {
			":Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
	l = {
		name = "LSP",
		o = { ":Lspsaga outline<cr>", "Outline" },
		a = { ":Lspsaga code_action<cr>", "Code Action" },
		--[[ d = { ":Lspsaga show_line_diagnostics<cr>", "Line Diagnostic" }, ]]
		d = { ':lua vim.diagnostic.open_float({ border = "rounded" })<cr>', "Line Diagnostic" },
		D = { ":Lspsaga show_buf_diagnostics<cr>", "Buffer Diagnostics" },
		p = { ":Lspsaga peek_definition<cr>", "Peek Definition" },
		w = { ":Lspsaga show_workspace_diagnostics<cr>", "Diagnostics" },
		h = { ":Lspsaga finder<cr>", "Signature" },
		r = { ":Telescope lsp_references<cr>", "References" },
		--[[ a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" }, ]]
		--[[ w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" }, ]]
		--[[ h = { ":lua vim.lsp.buf.hover()<cr>", "Signature" }, ]]
		--[[ r = { ":lua vim.lsp.buf.references()<cr>", "References" }, ]]
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>Mason<cr>", "Mason Info" },
		j = {
			vim.diagnostic.goto_next,
			"Next Diagnostic",
		},
		k = {
			vim.diagnostic.goto_prev,
			"Prev Diagnostic",
		},

		l = { vim.lsp.codelens.run, "CodeLens Action" },
		R = { ":Lspsaga rename<cr>", "Rename" },
		s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
		e = { ":Telescope quickfix<cr>", "Telescope Quickfix" },
	},

	M = {
		name = "Marks",
		a = { ":MarksListAll<cr>", "List All" },
		f = { ":MarksListBuf<cr>", "List Buffer" },
	},

	d = {
		name = "DB",
		t = { "<cmd>DBUIToggle<cr>", "Toggle UI" },
		b = { "<cmd>DBUIFindBuffer<cr>", "Find Buffer" },
	},
	b = {
		name = "Debug",
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
	},
	s = {
		h = { ":split<cr>", "Split Horizontally" },
		v = { ":vsplit<cr>", "Split Vertically" },
	},
	w = {
		name = "Worspaces",
		a = { ":WorkspacesAdd<cr>", "Adds Workspace" },
		r = { ":WorkspacesRemove<cr>", "Remove Workspace" },
		l = { ":WorkspacesList<cr>", "List Workspace" },
		f = { ":Telescope workspaces<cr>", "Find Workspace" },
		s = { ":Telescope workspacesSyncDirs<cr>", "Find Workspace" },
	},
	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
	},
	t = {
		name = "Git Worktree",
		f = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "List Worktree" },
		a = { ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Add Worktree" },
	},

	z = {
		name = "Zen",
		a = { "<cmd>TZAtaraxis<cr>", "Ataraxis" },
	},
}, { prefix = "<leader>" })

wk.register({
	d = { ":lua vim.lsp.buf.definition()<cr>", "Definition" },
	i = { ":lua vim.lsp.buf.implementation()<cr>", "Implementation" },
	s = { ":lua vim.lsp.buf.hover()<cr>", "Signature" },
}, { prefix = "g" })

wk.setup()
