--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "󰊄",
	Method = "",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰫧",
	Class = "C",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip/loaders/from_vscode").lazy_load({ paths = "~/.config/nvim/lua/snippets" })

			luasnip.config.set_config({
				region_check_events = "InsertEnter",
				delete_check_events = "InsertLeave",
			})

			luasnip.filetype_extend("typescript", { "javascript" })

			vim.api.nvim_create_autocmd("ModeChanged", {
				pattern = "*",
				callback = function()
					if
						((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
						and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
						and not luasnip.session.jump_active
					then
						luasnip.unlink_current()
					end
				end,
			})

			cmp.setup({
				preselect = "none",
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = {
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-u>"] = cmp.mapping.scroll_docs(-8),
					["<C-d>"] = cmp.mapping.scroll_docs(8),
					--[[ ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), ]]
					--[[ ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping. ]]
					["<C-c>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					-- Accept currently selected item. If none selected, `select` first item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						--[[ local copilot_keys = vim.fn["copilot#Accept"]() ]]
						--[[ if copilot_keys ~= "" and type(copilot_keys) == "string" then ]]
						--[[ 	vim.api.nvim_feedkeys(copilot_keys, "n", true) ]]
						--[[ else ]]
						fallback()
						--[[ end ]]
					end, {
						"i",
						"s",
					}),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						-- Kind icons
						-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						vim_item.menu = ({
							--[[ luasnip = "[Snippet]", ]]
							nvim_lsp = "[LSP]",
							buffer = "[Buffer]",
							path = "[Path]",
							crates = "[Crates]",
						})[entry.source.name]

						return vim_item
					end,
				},
				sources = {
					--[[ { name = "luasnip" }, ]]
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "crates" },
				},
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				experimental = {
					ghost_text = false,
					native_menu = false,
				},
			})

			cmp.setup.filetype({ "sql" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
				},
			})

			vim.keymap.set({ "i", "s" }, "<c-l>", function()
				if luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, true, true), "i", true)
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<c-h>", function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left>", true, true, true), "i", true)
				end
			end, { silent = true })
		end,
	},
}
