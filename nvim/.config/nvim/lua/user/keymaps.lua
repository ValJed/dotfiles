local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Block arrow keys to force using hjkl
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("v", "<Left>", "<Nop>", opts)
keymap("v", "<Right>", "<Nop>", opts)
keymap("v", "<Up>", "<Nop>", opts)
keymap("v", "<Down>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Basic
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("x", "<C-s>", "<ESC>:w<cr>", opts)
keymap("n", "µ", "£", opts)

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-S-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<cr>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bp<cr>", { silent = true })
keymap("n", "<S-l>", ":bn<cr>", { silent = true })

-- Moves
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-f>", "<C-b>zz", opts)
keymap("n", "<C-b>", "<C-f>zz", opts)

keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-j>", "<Down>", opts)

-- Insert --
-- Press kj fast to enter
keymap("i", "kj", "<ESC>", opts)
keymap("i", "KJ", "<ESC>", opts)
--[[ keymap("v", "kj", "<ESC>", opts) ]]

-- Indentation --
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("i", "<S-Tab>", "<C-d>", opts)

-- Select and paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<cr>gv-gv", opts)
keymap("x", "J", ":move '>+1<cr>gv-gv", opts)

-- Navigator
keymap("n", "<C-h>", ":NavigatorLeft<cr>", opts)
keymap("n", "<C-l>", ":NavigatorRight<cr>", opts)
keymap("n", "<C-k>", ":NavigatorUp<cr>", opts)
keymap("n", "<C-j>", ":NavigatorDown<cr>", opts)
keymap("n", "<C-p>", ":NavigatorPrevious<cr>", opts)

-- Harpoon
keymap("n", "<leader>&", ":lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>é", ":lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", '<leader>"', ":lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>'", ":lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<leader>(", ":lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "<leader>-", ":lua require('harpoon.ui').nav_file(6)<cr>", opts)

-- Terminal
keymap("n", "<C-t>", "<cmd>lua require('user.utils.functions').toggle_term()<cr>", opts)
keymap("t", "<C-t>", "<cmd>lua require('user.utils.functions').toggle_term()<cr>", opts)

-- Marks
keymap("n", "!", "`", opts)
