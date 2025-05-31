return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{ "mason-org/mason-lspconfig.nvim", config = function() end },
		"saghen/blink.cmp",
	},

	config = function()
		-- TODO: Add LSP key maps
	end,
}
