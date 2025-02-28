return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
			}
		},

		config = function()
			require('telescope').setup({
				pickers = {
					buffers = {
						theme = 'ivy'
					}
				},
				extensions = {
					fzf = {}
				}
			})
		end
	}
}
