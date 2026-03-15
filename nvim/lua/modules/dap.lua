local js_based_languages = {
	"typescript",
	"javascript",
	"vue",
}

local set_mapping = function(dap, dapui)
	MapGroup("Debug", "<leader>b", "")
	local mode = "n"
	Map(mode, "<leader>bt", function()
		dap.toggle_breakpoint()
	end, { desc = "Toggle breakpoint" })
	Map(mode, "<leader>bb", dap.step_back, { desc = "Step back" })
	Map(mode, "<leader>bc", dap.continue, { desc = "Continue" })
	Map(mode, "<leader>bC", dap.run_to_cursor, { desc = "Run to cursor" })
	Map(mode, "<leader>bd", dap.disconnect, { desc = "Disconnect" })
	Map(mode, "<leader>bg", dap.session, { desc = "Get session" })
	Map(mode, "<leader>bi", dap.step_into, { desc = "Step into" })
	Map(mode, "<leader>bo", dap.step_over, { desc = "Step over" })
	Map(mode, "<leader>bu", dap.step_out, { desc = "Step out" })
	Map(mode, "<leader>bp", dap.pause, { desc = "Pause" })
	Map(mode, "<leader>br", dap.repl.toggle, { desc = "Toggle repl" })
	Map(mode, "<leader>bs", dap.continue, { desc = "Start" })
	Map(mode, "<leader>bq", dap.close, { desc = "Quit" })
	Map(mode, "<leader>bU", function()
		dapui.toggle({ reset = true })
	end, { desc = "Toggle UI" })
	Map(mode, "<leader>be", function()
		dapui.eval(nil, { enter = true })
	end, { desc = "Eval" })
end

return {
	pack = function()
		vim.pack.add({
			"https://github.com/mfussenegger/nvim-dap",
			"https://github.com/theHamsta/nvim-dap-virtual-text",
			"https://github.com/rcarriga/nvim-dap-ui",
			"https://github.com/nvim-neotest/nvim-nio",
		})
	end,
	setup = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.set_log_level("TRACE")
		require("nvim-dap-virtual-text").setup({
			commented = true,
		})

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = 8123,
			executable = {
				command = "js-debug",
				args = { "8123" },
			},
		}

		dap.adapters["pwa-chrome"] = {
			type = "server",
			host = "localhost",
			port = 8123,
			executable = {
				command = "js-debug",
				args = { "8123" },
			},
		}

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				-- Debug single nodejs files
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file | " .. language,
					program = function()
						return vim.fn.input("Path to file: ", vim.fn.expand("%"), "file")
					end,
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				},
				-- Debug nodejs processes (make sure to add --inspect when you run the process)
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach | " .. language,
					processId = require("dap.utils").pick_process,
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				},
				-- Debug web applications (client side)
				{
					type = "pwa-chrome",
					request = "launch",
					name = "Chrome | " .. language,
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
					sourceMaps = true,
					--[[ webRoot = vim.fn.getcwd(), ]]
					--[[ protocol = "inspector", ]]
					--[[ userDataDir = false, ]]
				},
			}
		end

		dapui.setup({
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

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

		set_mapping(dap, dapui)
	end,
}
