local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

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
keymap("n", "µ", "£", opts)
keymap("n", "£", "0", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-h>", ":bprevious<CR>", { silent = true })
keymap("n", "<C-l>", ":bnext<CR>", { silent = true })

-- Moves
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-f>", "<C-b>zz", opts)
keymap("n", "<C-b>", "<C-f>zz", opts)

-- Insert --
-- Press kj fast to enter
keymap("x", "kj", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Indentation --
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("i", "<S-Tab>", "<C-d>", opts)

-- Select and paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Navigator
--[[ -- Better window navigation ]]
--[[ keymap("n", "<S-h>", "<C-w>h", opts) ]]
--[[ keymap("n", "<S-j>", "<C-w>j", opts) ]]
--[[ keymap("n", "<S-l>", "<C-w>l", opts) ]]
--[[ keymap("n", "<S-k>", "<C-w>k", opts) ]]

keymap("n", "<S-h>", ":NavigatorLeft<cr>", opts)
keymap("n", "<S-l>", ":NavigatorRight<cr>", opts)
keymap("n", "<S-k>", ":NavigatorUp<cr>", opts)
keymap("n", "<S-j>", ":NavigatorDown<cr>", opts)
keymap("n", "<S-p>", ":NavigatorPrevious<cr>", opts)

keymap("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)

-- Harpoon
keymap("n", "<leader>&", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>é", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", '<leader>"', ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>'", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
keymap("n", "<leader>(", ":lua require('harpoon.ui').nav_file(5)<CR>", opts)
keymap("n", "<leader>-", ":lua require('harpoon.ui').nav_file(6)<CR>", opts)
