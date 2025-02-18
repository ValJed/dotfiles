local tsdk = os.getenv("TS_LIB")

return {
	filetypes = { "astro" },
	init_options = {
		typescript = {
			tsdk = tsdk,
		},
	},
}
