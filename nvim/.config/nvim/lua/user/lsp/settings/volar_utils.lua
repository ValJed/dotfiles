local lspconfig_util = require("lspconfig.util")
local M = {}

function M.on_new_config(new_config, new_root_dir)
	local function get_typescript_server_path(root_dir)
		local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
		return project_root
				and (lspconfig_util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js"))
			or ""
	end

	if
		new_config.init_options
		and new_config.init_options.typescript
		and new_config.init_options.typescript.tsdk == ""
	then
		local ts_path = get_typescript_server_path(new_root_dir)
		new_config.init_options.typescript.tsdk = ts_path
	end
end

M.volar_cmd = { "vue-language-server", "--stdio" }
M.volar_root_dir = lspconfig_util.root_pattern("package.json")

return M
