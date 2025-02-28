return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		terminal_colors = true,

		config = function()
			local dracula = require('tokyonight')

			dracula.setup({
				style = 'storm',
				transparent = true,
			})

			vim.cmd.colorscheme 'tokyonight'
		end
	}
}
