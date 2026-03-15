local wk = require("which-key")
function Map(modes, mapping, action, options)
	local default_opts = { noremap = true, silent = true }
	if options and options.icon then
		wk.add({ { mapping, icon = { icon = options.icon, color = vim.g.icon_color } } })
		options.icon = nil
	end
	local opts = vim.tbl_extend("force", default_opts, options or {})
	vim.keymap.set(modes, mapping, action, opts)
end

function MapGroup(group, mapping, icon)
	wk.add({
		{ mapping, group = group, icon = { icon = icon, color = vim.g.icon_color } },
	})
end
