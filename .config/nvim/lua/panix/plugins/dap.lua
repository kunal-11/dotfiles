return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local dap = require("dap")

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.zig = {
			{
				name = "Attach to process",
				type = "codelldb",
				request = "attach",
				pid = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}
	end,
	keys = {
		{ "<leader>dc", function() require("dap").continue() end,          desc = "Debug: Continue/Attach" },
		{ "<leader>dt", function() require("dap").terminate() end,         desc = "Debug: Terminate" },
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
		{ "<leader>do", function() require("dap").step_over() end,         desc = "Debug: Step Over" },
		{ "<leader>di", function() require("dap").step_into() end,         desc = "Debug: Step Into" },
		{ "<leader>dO", function() require("dap").step_out() end,          desc = "Debug: Step Out" },
	},
}
