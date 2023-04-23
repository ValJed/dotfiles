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

dashboard.section.buttons.val = {
	dashboard.button("e", "  New File", ":enew<cr>"),
	dashboard.button("f", "  Find File", ":Telescope find_files hidden=true<cr>"),
	dashboard.button("r", "  Recent File", ":Telescope oldfiles<cr>"),
	dashboard.button("t", "  Find Text", ":Telescope live_grep<cr>"),
	dashboard.button("p", "  Find Project", ":Telescope workspaces<cr>"),
	dashboard.button("q", "  Quit", ":qa<cr>"),
}

dashboard.section.footer.val = {
	"",
	"",
	"",
	"󰮇  Let's invoke demons, baby  󰮇",
}

alpha.setup(dashboard.opts)
