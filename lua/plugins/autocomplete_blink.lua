return {
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',
		version = '*',
		opts = {
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
			keymap = { preset = 'default' },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono',
			},

			signature = { enabled = true },
		},
		opts_extend = { 'sources.default' }
	},
}
