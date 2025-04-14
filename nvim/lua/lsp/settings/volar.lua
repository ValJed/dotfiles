local volar_cmd = { "vue-language-server", "--stdio" }
local tsdk = os.getenv("TS_LIB")

return {
	cmd = volar_cmd,
	init_options = {
		typescript = {
			tsdk = tsdk,
		},
	},
}
