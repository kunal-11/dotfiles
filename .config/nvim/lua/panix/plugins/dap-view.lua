return {
	"igorlfs/nvim-dap-view",
	dependencies = { "mfussenegger/nvim-dap" },
	opts = {
		winbar = { show = true },
	},
	keys = {
		{ "<leader>dv", function() require("dap-view").toggle() end, desc = "Toggle DAP View" },
	},
	config = function(_, opts)
		require("dap-view").setup(opts)
		local dap = require("dap")
		dap.listeners.after.event_initialized["dap-view-config"] = function()
			require("dap-view").open()
		end
		dap.listeners.before.event_terminated["dap-view-config"] = function()
			require("dap-view").close()
		end
		dap.listeners.before.event_exited["dap-view-config"] = function()
			require("dap-view").close()
		end
	end,
}
