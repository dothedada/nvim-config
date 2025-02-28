return {
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',
		version = '*',
		opts = {
			sources = {
				default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					lazydev = {
						name = 'LazyDev',
						module = 'lazydev.integrations.blink',
						score_offset = 100,
					},
				},
			},
			keymap = { preset = 'default' },
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = 'mono',
			},

			completion = {
				menu = { border = 'rounded' },
				documentation = { window = { border = 'rounded' } },
			},

			signature = {
				enabled = true,
				trigger = {
					enabled = true,
				},
				window = {
					min_width = 10,
					max_width = 80,
					max_height = 50,
					border = 'rounded',
					scrollbar = true,
					treesitter_highlighting = true,
					show_documentation = true,
				},
			},
		},
		opts_extend = { 'sources.default' },
	},
}
