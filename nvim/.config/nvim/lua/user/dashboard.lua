local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⠶⠶⠶⠶⠶⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠶⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⡋⢿⠳⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣆⠀⢀⡀⠀⠀⠀⠀⠀⢀⣴⠞⣿⠙⠗⣄⠀⠀⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠀⣠⡞⠁⠀⠹⣦⣄⡈⠙⠷⣄⡀⠀⠀⠀⠀⠹⣦⣿⣿⣶⠏⠀⠀⠀⢀⣠⠾⠋⠁⠘⣃⣤⡞⠈⢷⣄⠀⠀⠀⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⡜⠋⠀⠀⣀⠀⠙⠻⣿⣿⣷⣖⣪⢄⡀⠀⠀⠀⢹⣿⣿⡟⠀⠀⣠⡴⢟⣥⣴⣶⣿⣿⡿⠋⠀⠀⠀⠙⣧⡀⠀⠀⠀⠀]],
	[[⠀⠀⢀⠔⠀⠀⠀⠀⠀⣀⣈⠀⠘⣦⠉⠛⠿⣿⣦⡚⣆⢢⡀⠈⣿⣿⡇⣴⠞⢉⢼⣽⣿⡿⠟⣋⠁⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀⠀]],
	[[⠀⢠⠁⠀⠀⢀⠔⠈⠀⠀⠀⠀⠙⢻⡆⠀⠀⠈⢿⣿⣇⣧⠙⠇⣿⣿⡇⠀⢀⢮⣿⣿⠏⠀⢰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀]],
	[[⠀⡄⠀⠀⢠⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⢻⣿⣮⠧⣴⣿⣿⣷⣤⢾⣴⣿⠏⠀⢀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀]],
	[[⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⣀⡄⣿⣿⣾⣿⣿⣿⣿⣿⣾⣿⣏⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⠀]],
	[[⠀⣔⠄⠀⠘⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡦⢞⣽⣿⣿⣿⣿⣿⣟⣿⣵⣿⣿⣿⣿⣷⣦⣋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀]],
	[[⠀⣿⠈⠢⢀⠀⠀⡀⠀⠀⠀⠀⠀⣠⢖⣅⡺⢿⣿⣿⠟⠛⠿⣿⣾⣿⣾⠟⠛⠛⣿⡿⠿⣋⣑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀]],
	[[⠀⣿⠀⠀⠀⠈⠀⠀⠁⠀⣀⡴⠟⣱⣿⣿⣷⠀⠀⠸⣆⠀⠀⢹⣿⣿⠇⠀⠀⣠⡏⣸⢳⣿⣿⣷⡹⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀]],
	[[⠀⣿⠀⠀⠀⠀⠀⢀⣤⠞⠋⡄⢰⣿⣿⣿⣿⣧⠀⠀⠹⣿⣦⣤⣿⣿⣤⣶⣿⠏⢠⢫⣿⣿⣿⣿⣷⡀⠙⠷⣤⡀⠀⠀⠀⠀⠀⣿⠀]],
	[[⠀⢸⡆⠀⢀⣠⡾⠋⠁⠀⠀⢨⠀⠈⢻⣿⣿⣿⣧⣀⠀⠈⢻⣿⣿⣿⣿⠟⠁⠀⣠⣿⣿⣿⣿⣿⣿⣧⠀⠀⠈⠛⢶⣄⠀⠀⢸⡇⠀]],
	[[⠀⠈⣧⣴⣟⣁⣀⣀⣀⣀⢀⣾⣷⣤⡀⠙⣿⣿⣿⣿⡟⠉⠁⠈⠉⠉⠁⠉⢲⣾⣿⣿⣿⣿⣿⣿⣿⣿⣧⢀⣀⣀⣀⣈⣻⣦⣾⠁⠀]],
	[[⠀⠀⢹⣏⠉⠉⠉⠉⠉⠉⣸⣿⣿⣿⣿⣦⠀⠙⢿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠉⠉⠉⠉⠉⣹⠏⠀⠀]],
	[[⠀⠀⠀⢻⡄⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣷⠄⠀⠁⠐⢀⠀⠀⠀⠀⠀⠀⢄⢀⠝⢿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣰⡟⠀⠀⠀]],
	[[⠀⠀⠀⠀⠻⣆⠀⠀⠀⣸⣿⣿⣿⣿⡟⠙⠁⠀⠈⠈⠸⠰⠀⠀⠀⠀⠀⢀⠇⠁⠀⠅⢄⡛⠻⠿⠿⣿⣿⣿⡤⠤⢤⣤⣭⣄⠀⠀⠀]],
	[[⠀⠀⠀⠀⠀⠙⣧⡀⠀⣿⡟⣿⠏⠋⠀⠀⣠⣴⣿⣿⣿⣶⣤⣀⣀⣀⣤⣤⣶⣶⣶⣶⣌⠀⠄⠀⢉⠻⡟⢿⣇⢀⡴⠉⠻⣿⣿⣦⠀]],
	[[⠀⠀⠀⠀⠀⠀⠈⠻⠸⠟⠀⠁⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠈⠀⠈⠁⢈⠿⠘⠁⠀⠀⢹⣿⣿⣧]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⣀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⣀⡴⠟⠁⠀⠀⠀⠀⢸⣿⣿⣿]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣦⣄⡀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠁⢀⣠⣴⠞⠋⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠳⠶⡤⡠⣼⣿⡿⢋⣽⡻⣿⣿⡦⡠⣤⠶⠞⠛⠉⠀⠀⢠⣀⠀⠀⠀⣀⣠⣾⣿⣿⣿⠏]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠿⠏⠀⠉⠉⠉⠈⠻⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⣿⣿⣿⡿⠛⠁⠀]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
}

--[[ dashboard.section.header.opts.hl = "Error" ]]

dashboard.section.buttons.val = {
	dashboard.button("e", "  New File", ":enew<CR>"),
	dashboard.button("f", "  Find File", ":Telescope find_files hidden=true<CR>"),
	dashboard.button("r", "  Recent File", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "  Find Text", ":Telescope live_grep<CR>"),
	dashboard.button("p", "  Find Project", ":Telescope projects<cr>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = {
	"",
	"",
	"",
	"󰮇  Let's invoke demons, baby  󰮇",
}

alpha.setup(dashboard.opts)
