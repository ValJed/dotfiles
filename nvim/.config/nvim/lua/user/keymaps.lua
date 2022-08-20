local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])

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

-- Move line up and down
--[[ keymap("", "<C-S-K>", ":m .+1<CR>==", opts) ]]
--[[ keymap("", "<C-S-J>", ":m .-2<CR>==", opts) ]]

-- Insert --
-- Press kj fast to enter
keymap("x", "kj", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Select and paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files hidden=true prompt_prefix=🔍<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep hidden=true prompt_prefix=🔍<cr>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Navigator
-- Better window navigation
keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-l>", "<C-w>l", opts)
keymap("n", "<S-k>", "<C-w>k", opts)

keymap("n", "<S-Left>", ":NavigatorLeft<cr>", opts)
keymap("n", "<S-Right>", ":NavigatorRight<cr>", opts)
keymap("n", "<S-Up>", ":NavigatorUp<cr>", opts)
keymap("n", "<S-Down>", ":NavigatorDown<cr>", opts)
keymap("n", "<S-p>", ":NavigatorPrevious<cr>", opts)

-- Bufferline
--[[ keymap("n", "<C-h>", ":BufferLineCyclePrev<cr>", opts) ]]
--[[ keymap("n", "<C-l>", ":BufferLineCycleNext<cr>", opts) ]]
--[[ keymap("n", "<C-S-h>", ":BufferLineMovePrev<cr>", opts) ]]
--[[ keymap("n", "<C-S-l>", ":BufferLineMoveNext<cr>", opts) ]]
--[[ keymap("n", "<C-x>", ":Bdelete<cr>", opts) ]]

keymap("n", "<C-PageUp>", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "<C-PageDown>", ":BufferLineCycleNext<cr>", opts)
keymap("n", "<C-S-PageUp>", ":BufferLineMovePrev<cr>", opts)
keymap("n", "<C-S-PageDown>", ":BufferLineMoveNext<cr>", opts)
keymap("n", "<C-x>", ":Bdelete<cr>", opts)

-- Git
keymap("n", "lg", ":LazyGit<cr>", opts)

-- LSP
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--[[ keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) ]]
-- keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- keymap("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
