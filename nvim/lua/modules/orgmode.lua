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
					org_insert_heading = "<leader>oh",
					org_insert_heading_respect_content = "<leader>oH",
					org_schedule = "<leader>os",
					org_set_tags_command = "<leader>oT",
				},
			},
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
