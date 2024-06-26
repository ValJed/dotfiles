return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			dap.adapters.firefox = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/Documents/tools/vscode-firefox-debug/dist/adapter.bundle.js" },
			}

			dap.configurations.vue = {
				{
					name = "Debug with Firefox",
					type = "firefox",
					request = "launch",
					reAttach = true,
					url = "http://localhost:3000/",
					webRoot = "${workspaceFolder}",
					firefoxExecutable = "/usr/bin/firefox",
				},
			}

			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/Documents/tools/vscode-node-debug2/out/src/nodeDebug.js" },
			}

			dap.configurations.javascript = {
				{
					name = "Debug with Firefox",
					type = "firefox",
					request = "launch",
					reAttach = true,
					url = "http://localhost:3000/",
					webRoot = "${workspaceFolder}",
					firefoxExecutable = "/usr/bin/firefox",
				},
				{
					name = "Launch",
					type = "node2",
					request = "launch",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					console = "integratedTerminal",
				},
				{
					-- For this to work you need to make sure the node process is started with the `--inspect` flag.
					name = "Attach to process",
					type = "node2",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
			}
		end,
	},
}
