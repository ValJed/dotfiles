-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local wk = require("which-key")
wk.setup({
	preset = "helix",
	icons = {
		rules = {
			{ pattern = "find", icon = "", color = vim.g.icon_color },
			{ pattern = "color", icon = "", color = vim.g.icon_color },
			{ pattern = "workspaces", icon = "", color = vim.g.icon_color },
			{ pattern = "marks", icon = "", color = vim.g.icon_color },
			{ pattern = "toggle", icon = "", color = vim.g.icon_color },
			{ pattern = "file", icon = "", color = vim.g.icon_color },
			{ pattern = "pause", icon = "", color = vim.g.icon_color },
			{ pattern = "play", icon = "", color = vim.g.icon_color },
			{ pattern = "quit", icon = "󰈆", color = vim.g.icon_color },
		},
	},
})

--Remap space as leader key
Map("", "<Space>", "<Nop>")

-- Block arrow keys to force using hjkl
Map("n", "<Left>", "<Nop>")
Map("n", "<Right>", "<Nop>")
Map("n", "<Up>", "<Nop>")
Map("n", "<Down>", "<Nop>")
Map("v", "<Left>", "<Nop>")
Map("v", "<Right>", "<Nop>")
Map("v", "<Up>", "<Nop>")
Map("v", "<Down>", "<Nop>")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local utils = require("utils.functions")

-- Basic
Map("n", "<C-s>", ":w<cr>")
Map("n", "<C-s>", ":w<cr>")
Map("x", "<C-s>", "<ESC>:w<cr>")
Map("n", "<C-c>", function()
	utils.smart_close(true)
end)

-- Notifications
Map("n", "<leader>n", function()
	vim.cmd("Telescope notify")
end, { desc = "Notifications", icon = "󰎟" })

-- Zen
Map("n", "<leader>z", function()
	vim.cmd("ZenMode")
end, { desc = "Zen Mode", icon = "󱅻" })

-- Dashboard
Map("n", "<leader>;", function()
	vim.cmd("Alpha")
end, { desc = "Dashboard", icon = "󰠚" })

-- Next Prev occurences
Map("n", "&", "£")
Map("n", ".", function()
	vim.api.nvim_feedkeys(":", "n", false)
end)

-- Split
MapGroup("Split", "<leader>s", "󰨑")
Map("n", "<leader>sh", function()
	vim.cmd("split")
end, { desc = "Split Horizontally" })

Map("n", "<leader>sv", function()
	vim.cmd("vsplit")
end, { desc = "Split Vertically" })

-- Resize with arrows
Map("n", "<C-S-Up>", ":resize +2<cr>")
Map("n", "<C-S-Down>", ":resize -2<cr>")
Map("n", "<C-S-Right>", ":vertical resize +2<cr>")
Map("n", "<C-S-Left>", ":vertical resize -2<cr>")

-- Navigate buffers
Map("n", "<S-h>", ":BufSurfBack<cr>")
Map("n", "<S-l>", ":BufSurfForward<cr>")

-- Moves
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "<C-f>", "<C-f>zz")
Map("n", "<C-b>", "<C-b>zz")

Map("i", "<C-k>", "<Up>")
Map("i", "<C-j>", "<Down>")

-- Indentation --
Map("v", "<Tab>", ">gv")
Map("v", "<S-Tab>", "<gv")
Map("i", "<S-Tab>", "<C-d>")

-- Visual Block --

-- Select and paste
Map("v", "p", '"_dp')
Map("v", "P", '"_dP')
Map("x", "p", '"_dp')
Map("x", "P", '"_dP')

-- Align multiple lines together
Map("x", "A", "J")

-- Move text up and down
Map("x", "K", ":move '<-2<cr>gv-gv")
Map("x", "J", ":move '>+1<cr>gv-gv")

-- Navigator
Map("n", "<C-h>", ":NavigatorLeft<cr>")
Map("n", "<C-l>", ":NavigatorRight<cr>")
Map("n", "<C-k>", ":NavigatorUp<cr>")
Map("n", "<C-j>", ":NavigatorDown<cr>")
Map("n", "<C-p>", ":NavigatorPrevious<cr>")
