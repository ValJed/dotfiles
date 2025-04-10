local js_based_languages = {
	"typescript",
	"javascript",
	"vue",
}

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			for _, language in ipairs(js_based_languages) do
				dap.configurations[language] = {
					-- Debug single nodejs files
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
					},
					-- Debug nodejs processes (make sure to add --inspect when you run the process)
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
					},
					-- Debug web applications (client side)
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch & Debug Chrome",
						url = function()
							local co = coroutine.running()
							return coroutine.create(function()
								vim.ui.input({
									prompt = "Enter URL: ",
									default = "http://localhost:3000",
								}, function(url)
									if url == nil or url == "" then
										return
									else
										coroutine.resume(co, url)
									end
								end)
							end)
						end,
						webRoot = vim.fn.getcwd(),
						protocol = "inspector",
						sourceMaps = true,
						userDataDir = false,
					},
					-- Divider for the launch.json derived configs
					{
						name = "----- ↓ launch.json configs ↓ -----",
						type = "",
						request = "launch",
					},
				}
			end
		end,
	},

	-- fancy UI for the debugger
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	{
		"mxsdev/nvim-dap-vscode-js",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("dap-vscode-js").setup({
				-- Path of node executable. Defaults to $NODE_PATH, and then "node"
				-- node_path = "node",

				-- Path to vscode-js-debug installation.
				debugger_cmd = { "js-debug" },

				-- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
				-- debugger_cmd = { "js-debug-adapter" },

				-- which adapters to register in nvim-dap
				adapters = {
					"chrome",
					"pwa-node",
					"pwa-chrome",
					"pwa-msedge",
					"pwa-extensionHost",
					"node-terminal",
				},

				-- Path for file logging
				-- log_file_path = "(stdpath cache)/dap_vscode_js.log",

				-- Logging level for output to file. Set to false to disable logging.
				-- log_file_level = false,

				-- Logging level for output to console. Set to false to disable console output.
				-- log_console_level = vim.log.levels.ERROR,
			})
		end,
	},
}
