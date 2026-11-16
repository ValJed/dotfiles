local query_driver = "--query-driver=" .. vim.env.GCC_PATH
return {
	cmd = { "clangd", "--background-index", query_driver },
}
