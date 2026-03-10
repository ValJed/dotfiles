function Map(modes, mapping, action, options)
	local default_opts = { noremap = true, silent = true }
	local opts = vim.tbl_extend("force", default_opts, options or {})
	vim.keymap.set(modes, mapping, action, opts)
end
