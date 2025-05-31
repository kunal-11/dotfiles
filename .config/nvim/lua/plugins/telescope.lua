return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
      				override_file_sorter = true,
     				case_mode = "smart_case", 
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown {
				}
			}
		},
	},
	config = function()
		require('telescope').load_extension('fzf')
		require('telescope').load_extension('ui-select')
		
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>fo', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = 'Telescope live grep' })
			
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

	end,
}
