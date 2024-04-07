function Opts(desc)
	local opt = { noremap = true, silent = true }
	if desc then
		opt.desc = desc
	end

	return opt
end
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
keymap("n", "<C-f>", "<C-f>zz", opts)
keymap("n", "<C-b>", "<C-b>zz", opts)

keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-j>", "<Down>", opts)

-- Insert --
-- Press kj fast to enter
keymap("i", "kj", "<ESC>", opts)
keymap("i", "KJ", "<ESC>", opts)

-- Indentation --
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("i", "<S-Tab>", "<C-d>", opts)

-- Select and paste
keymap("v", "p", '"_dP', opts)
keymap("x", "p", '"_dP', opts)
--[[ keymap("v", "p", ":lua require('user.utils.functions').replace_from_register()<cr>", opts) ]]

-- Visual Block --

-- Align multiple lines together
keymap("x", "A", "J", opts)

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
keymap("n", "<leader>m", ":lua require('harpoon'):list():add()<cr>", Opts("Mark File"))
keymap(
	"n",
	"<leader>a",
	":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
	Opts("File Marked")
)

keymap("n", "<leader>&", ":lua require('harpoon'):list():select(1)<cr>", opts)
keymap("n", "<leader>é", ":lua require('harpoon'):list():select(2)<cr>", opts)
keymap("n", '<leader>"', ":lua require('harpoon'):list():select(3)<cr>", opts)
keymap("n", "<leader>'", ":lua require('harpoon'):list():select(4)<cr>", opts)
keymap("n", "<leader>(", ":lua require('harpoon'):list():select(5)<cr>", opts)
keymap("n", "<leader>-", ":lua require('harpoon'):list():select(6)<cr>", opts)
keymap("n", "<leader>è", ":lua require('harpoon'):list():select(7)<cr>", opts)
keymap("n", "<leader>_", ":lua require('harpoon'):list():select(8)<cr>", opts)
keymap("n", "<leader>ç", ":lua require('harpoon'):list():select(9)<cr>", opts)
