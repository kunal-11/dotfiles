return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},

			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},

			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},

			{
				"<leader>dT",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>dn",
				function()
					require("dap").step_over()
				end,
			},
		},
		dependencies = {
			{
				"igorlfs/nvim-dap-view",
				-- Alternative UI.  https://igorlfs.github.io/nvim-dap-view/keymaps
				-- Load with :DapViewOpen
				-- Use g? in windows to see keymaps.
				---@module 'dap-view'
				opts = {},
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = true,
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
		},
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = {
					handlers = {},
					automatic_installation = false,
					ensure_installed = {},
				},
				dependencies = {
					"mfussenegger/nvim-dap",
					"mason-org/mason.nvim",
				},
			},
			{
				"leoluz/nvim-dap-go",
				config = true,
				dependencies = {
					"mfussenegger/nvim-dap",
				},
				keys = {
					{
						"<leader>dt",
						function()
							require("dap-go").debug_test()
						end,
						desc = "Debug test",
					},
				},
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				config = true,
				dependencies = {
					"mfussenegger/nvim-dap",
				},
			},
			{
				"nvim-neotest/nvim-nio",
			},
		},
	},
}
