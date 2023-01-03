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
keymap("", "<C-s>", ":w<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Split
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)

-- Moves
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Move line up and down
--[[ keymap("", "<C-S-K>", ":m .+1<CR>==", opts) ]]
--[[ keymap("", "<C-S-J>", ":m .-2<CR>==", opts) ]]

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

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files prompt_prefix=🔍<cr>", opts)
keymap("n", "<leader>d", ":Telescope find_files hidden=true prompt_prefix=🔍<cr>", opts)
keymap("n", "<leader>g", ":Telescope live_grep prompt_prefix=🔍<cr>", opts)
keymap("n", "<leader>i", ":NvimTreeToggle<cr>", opts)

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

-- Bufferline
--[[ keymap("n", "<C-h>", ":BufferLineCyclePrev<cr>", opts) ]]
--[[ keymap("n", "<C-l>", ":BufferLineCycleNext<cr>", opts) ]]
--[[ keymap("n", "<C-S-h>", ":BufferLineMovePrev<cr>", opts) ]]
--[[ keymap("n", "<C-S-l>", ":BufferLineMoveNext<cr>", opts) ]]
--[[ keymap("n", "<C-x>", ":Bdelete<cr>", opts) ]]

--[[ keymap("n", "<C-PageUp>", ":BufferLineCyclePrev<cr>", opts) ]]
--[[ keymap("n", "<C-PageDown>", ":BufferLineCycleNext<cr>", opts) ]]
--[[ keymap("n", "<C-S-PageUp>", ":BufferLineMovePrev<cr>", opts) ]]
--[[ keymap("n", "<C-S-PageDown>", ":BufferLineMoveNext<cr>", opts) ]]
--[[ keymap("n", "<C-x>", ":Bdelete<cr>", opts) ]]

-- Git
keymap("n", "<leader>lg", ":LazyGit<cr>", opts)

-- LSP
--[[ keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) ]]
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
--[[ keymap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts) ]]
-- keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
-- keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
-- keymap("n", "<leader>f", ":lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[d", ':lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "gl", ':lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
keymap("n", "]d", ':lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)

-- Harpoon
keymap("n", "<leader>e", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>&", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>é", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", '<leader>"', ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>'", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
keymap("n", "<leader>(", ":lua require('harpoon.ui').nav_file(5)<CR>", opts)
keymap("n", "<leader>-", ":lua require('harpoon.ui').nav_file(6)<CR>", opts)
