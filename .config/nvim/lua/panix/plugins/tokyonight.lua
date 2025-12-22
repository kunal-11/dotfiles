return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			dim_inactive = true,
			style = "night"
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
