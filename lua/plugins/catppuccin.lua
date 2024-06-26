return {
	'catppuccin/nvim',

	lazy = false,
	priority = 1000,
	name = 'catppuccin',

	opts = {
		flavour = 'macchiato', -- latte, frappe, macchiato, mocha
		-- transparent_background = false, -- para mac
		transparent_background = true,-- para linux
		show_end_of_buffer = true,
		term_colors = false,
		styles = {
			comments = { 'italic' },
			conditionals = { 'italic' },
		},
		-- color_overrides = {
		-- 	mocha = {
		-- 		rosewater = '#ea6962',
		-- 		flamingo = '#ea6962',
		-- 		red = '#ea6962',
		-- 		maroon = '#ea6962',
		-- 		pink = '#d3869b',
		-- 		mauve = '#d3869b',
		-- 		peach = '#e78a4e',
		-- 		yellow = '#d8a657',
		-- 		green = '#a9b665',
		-- 		teal = '#89b482',
		-- 		sky = '#89b482',
		-- 		sapphire = '#89b482',
		-- 		blue = '#7daea3',
		-- 		lavender = '#7daea3',
		-- 		text = '#ebdbb2',
		-- 		subtext1 = '#d5c4a1',
		-- 		subtext0 = '#bdae93',
		-- 		overlay2 = '#a89984',
		-- 		overlay1 = '#928374',
		-- 		overlay0 = '#595959',
		-- 		surface2 = '#4d4d4d',
		-- 		surface1 = '#404040',
		-- 		surface0 = '#292929',
		-- 		base = '#1d2021',
		-- 		mantle = '#191b1c',
		-- 		crust = '#141617',
		-- 	},
		-- },
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
