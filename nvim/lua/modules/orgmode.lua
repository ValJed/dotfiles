return {
	pack = function()
		vim.pack.add({
			"https://github.com/nvim-orgmode/orgmode",
		})
	end,
	setup = function()
		local orgmode = require("orgmode")
		orgmode.setup({
			org_agenda_files = "~/orgfiles/**/*",
			org_default_notes_file = "~/orgfiles/refile.org",
			mappings = {
				org = {
					org_insert_todo_heading = "<leader>ot",
					org_insert_todo_heading_respect_content = "<leader>oT",
					org_insert_heading_respect_content = "<leader>oh",
					org_schedule = "<leader>os",
					org_set_tags_command = "<leader>om",
				},
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "org",
			callback = function()
				vim.keymap.set("n", "<leader>ob", function()
					local lang = vim.fn.input("Language: ")
					local row = vim.api.nvim_win_get_cursor(0)[1]
					vim.api.nvim_buf_set_lines(0, row, row, false, {
						"#+begin_src " .. lang,
						"",
						"#+end_src",
					})
					vim.api.nvim_win_set_cursor(0, { row + 2, 0 }) -- land inside the block
				end, { buffer = true, desc = "Insert org src block" })
			end,
		})

		local mode = "n"
		MapGroup("Org", "<leader>o", "")
		Map(mode, "<leader>oc", function()
			vim.cmd("Org capture")
		end, { desc = "Capture" })
		Map(mode, "<leader>oa", function()
			vim.cmd("Org agenda")
		end, { desc = "Agenda" })
	end,
}
