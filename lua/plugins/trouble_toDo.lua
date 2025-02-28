return {
	{
		'folke/trouble.nvim',
		opts = {},
		cmd = 'Trouble',
	},
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			keywords = {
				FIX = { icon = ' ', color = 'error', alt = { 'BUG' } },
				TODO = { icon = ' ', color = 'info' },
				HACK = { icon = ' ', color = 'warning' },
				WARN = { icon = ' ', color = 'warning', alt = { 'WARNING' } },
				PERF = { icon = ' ', alt = { 'OPTIMIZE' } },
				NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
				TEST = { icon = '󱦟 ', color = 'test', alt = { 'TESTING' } },
			},
		},
	},
}
