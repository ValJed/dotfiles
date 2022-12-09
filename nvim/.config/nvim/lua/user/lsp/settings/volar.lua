local util = require("lspconfig.util")
--[[ local volar_root_dir = lspconfig_util.root_pattern("package.json") ]]

--[[ local volar_path = util.path.join(vim.fn.stdpath("data"), "lsp_servers", "volar", "node_modules") ]]
--[[ local global_ts_server_path = util.path.join(volar_path, "typescript", "lib") ]]
--[[]]
--[[ local function get_typescript_lib_path(root_dir) ]]
--[[ 	local project_root = util.find_node_modules_ancestor(root_dir) ]]
--[[ 	return project_root and (util.path.join(project_root, "node_modules", "typescript", "lib")) or global_ts_server_path ]]
--[[ end ]]

local function on_new_config(new_config, new_root_dir)
	local function get_typescript_server_path(root_dir)
		local project_root = util.find_node_modules_ancestor(root_dir)
		return project_root
				and (util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js"))
			or ""
	end
	print("ttttt ", new_config.init_options.typescript.tsdk)
	if
		new_config.init_options
		and new_config.init_options.typescript
		and new_config.init_options.typescript.tsdk == ""
	then
		local ts_path = get_typescript_server_path(new_root_dir)
		print("ts path: ", ts_path)
		new_config.init_options.typescript.tsdk = ts_path
	end
end

local volar_cmd = { "vue-language-server", "--stdio" }
local volar_root_dir = util.root_pattern("package.json")

print("dir => ", volar_root_dir)

return {
	cmd = volar_cmd,
	root_dir = volar_root_dir,
	--[[ on_new_config = on_new_config, ]]

	filetypes = { "vue" },
	-- If you want to use Volar's Take Over Mode (if you know, you know):
	--filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
	init_options = {
		typescript = {
			tsdk = "/usr/local/lib/node_modules/typescript/lib",
		},
		languageFeatures = {
			implementation = true, -- new in @volar/vue-language-server v0.33
			documentHighlight = true,
			codeLens = { showReferencesNotification = true },
			-- not supported - https://github.com/neovim/neovim/pull/15723
			semanticTokens = false,
			diagnostics = true,
			schemaRequestService = true,
			documentLink = true,
			references = true,
			definition = true,
			typeDefinition = true,
			callHierarchy = true,
			hover = true,
			rename = true,
			renameFileRefactoring = true,
			signatureHelp = true,
			codeAction = true,
			workspaceSymbol = true,
			completion = {
				defaultTagNameCase = "both",
				defaultAttrNameCase = "kebabCase",
				getDocumentNameCasesRequest = false,
				getDocumentSelectionRequest = false,
			},
		},
		documentFeatures = {
			selectionRange = true,
			foldingRange = true,
			linkedEditingRange = true,
			documentSymbol = true,
			-- not supported - https://github.com/neovim/neovim/pull/13654
			documentColor = false,
			documentFormatting = {
				defaultPrintWidth = 100,
			},
		},
	},
}
