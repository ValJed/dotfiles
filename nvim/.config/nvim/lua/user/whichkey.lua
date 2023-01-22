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
	["a"] = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Show Marked Files" },
	["q"] = { ":lua require('user.utils.functions').smart_quit()<CR>", "Quit" },
	["c"] = { ":BufferKill<CR>", "Close Buffer" },
	["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },

	f = {
		name = "Find",
		f = { ":Telescope find_files<cr>", "Find file" },
		h = { ":Telescope find_files hidden=true<cr>", "Find hidden files" },
		t = { ":Telescope live_grep<cr>", "Find text" },
		c = { ":Telescope colorscheme<cr>", "Colorscheme" },
		T = { ":Telescope help_tags<cr>", "Find Help" },
		H = { ":Telescope highlights<cr>", "Find highlight groups" },
		M = { ":Telescope man_pages<cr>", "Man Pages" },
		r = { ":Telescope oldfiles<cr>", "Open Recent File" },
		R = { ":Telescope registers<cr>", "Registers" },
		k = { ":Telescope keymaps<cr>", "Keymaps" },
		C = { ":Telescope commands<cr>", "Commands" },
		p = {
			":lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
			"Colorscheme with Preview",
		},
	},
	g = {
		name = "Git",
		g = { ":LazyGit<cr>", "LazyGit" },
		j = { ":Gitsigns next_hunk<cr>", "Next Hunk" },
		k = { ":Gitsigns prev_hunk<cr>", "Prev Hunk" },
		b = { ":Gitsigns blame_line<cr>", "Blame" },
		p = { ":Gitsigns preview_hunk<cr>", "Preview Hunk" },
		r = { ":Gitsigns reset_hunk<cr>", "Reset Hunk" },
		R = { ":Gitsigns reset_buffer<cr>", "Reset Buffer" },
		s = { ":Gitsigns stage_hunk<cr>", "Stage Hunk" },
		u = {
			":Gitsigns undo_stage_hunk<cr>",
			"Undo Stage Hunk",
		},
		o = { ":Telescope git_status<cr>", "Open changed file" },
		B = { ":Telescope git_branches<cr>", "Checkout branch" },
		c = { ":Telescope git_commits<cr>", "Checkout commit" },
		C = {
			":Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			":Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { ':lua vim.diagnostic.open_float({ border = "rounded" })<CR>', "Line Diagnostic" },
		D = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
		w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		h = { ":lua vim.lsp.buf.hover()<CR>", "Signature" },
		r = { ":lua vim.lsp.buf.references()<CR>", "References" },
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
		q = { vim.diagnostic.setloclist, "Quickfix" },
		R = { vim.lsp.buf.rename, "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
	},
	d = {
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
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	s = {
		h = { ":split<cr>", "Split Horizontally" },
		v = { ":vsplit<cr>", "Split Vertically" },
	},
	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
	},
}, { prefix = "<leader>" })

wk.register({
	d = { ":lua vim.lsp.buf.definition()", "Definition" },
	i = { ":lua vim.lsp.buf.implementation()<CR>", "Implementation" },
}, { prefix = "<g>" })

wk.setup()