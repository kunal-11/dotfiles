return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "mason-org/mason.nvim", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LspGroup", {}),
			callback = function(e)
				local opts = { buffer = e.buf }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set({ "v", "n" }, "gr", require("telescope.builtin").lsp_references, opts)
				vim.keymap.set({ "v", "n" }, "gi", require("telescope.builtin").lsp_implementations, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
			end,
		})

		-- Add blink LSP capabilities
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			require("blink.cmp").get_lsp_capabilities()
		)

		require("mason-lspconfig").setup({
			automatic_enable = true,
			ensure_installed = {
				"lua_ls",
				"gopls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({ capabilities = capabilities })
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			float = {
				focusable = false,
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
