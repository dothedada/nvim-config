return {
	'catppuccin/nvim',

	lazy = false,
	priority = 1000,
	name = 'catppuccin',

	opts = {
		flavour = 'macchiato', -- latte, frappe, macchiato, mocha
		transparent_background = true,-- para linux
		show_end_of_buffer = true,
		term_colors = false,
		styles = {
			comments = { 'italic' },
			conditionals = { 'italic' },
		},
		custom_highlights = {},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = false,
			mini = {
				enabled = true,
				indentscope_color = '',
			},
		},
	},
}
