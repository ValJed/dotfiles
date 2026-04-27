return {
	pack = function()
		vim.pack.add({
			"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
			"https://github.com/numToStr/Comment.nvim",
		})
	end,
	setup = function()
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
