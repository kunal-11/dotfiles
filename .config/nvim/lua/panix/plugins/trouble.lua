return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				modes = {
					mydiags = {
						mode = "diagnostics", -- inherit from diagnostics mode
						filter = {
							any = {
								buf = 0, -- current buffer
								{
									severity = vim.diagnostic.severity.ERROR, -- errors only
									-- limit to files in the current project
									function(item)
										return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
									end,
								},
							},
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")

			vim.keymap.set("n", "[t", function()
				require("trouble").next({ skip_groups = true, jump = true })
			end)

			vim.keymap.set("n", "]t", function()
				require("trouble").prev({ skip_groups = true, jump = true })
			end)
		end,
	},
}
