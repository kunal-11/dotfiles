return {
	"saghen/blink.cmp",
	opts = {
		keymap = { preset = "super-tab" },
		signature = { enabled = true },

		completion = {
			ghost_text = { enabled = true, show_with_menu = true },
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		fuzzy = { implementation = "lua" },
	},
	opts_extend = { "sources.default" },
}
