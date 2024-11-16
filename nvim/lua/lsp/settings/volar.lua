local util = require("lspconfig.util")

local volar_cmd = { "vue-language-server", "--stdio" }
local volar_root_dir = util.root_pattern("package.json")
local ts_lib = 

return {
	cmd = volar_cmd,
	root_dir = volar_root_dir,

	filetypes = { "vue" },
	-- If you want to use Volar's Take Over Mode (if you know, you know):
	--filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
	init_options = {
		typescript = {
			tsdk = os.getenv("TS_LIB"),
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
