return {
	'nvim-telescope/telescope.nvim',

	branch = '0.1.x',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},

	cmd = { 'Telescope' },

	opts = {
		defaults = {
			file_ignore_patterns = {
				'.git/',
				'.cache',
				'node_modules/',
				'%.o',
				'%.a',
				'%.out',
				'%.class',
				'%.pdf',
				'%.mkv',
				'%.mp4',
				'%.zip',
			},
		},
	},

	config = function()
		require('telescope').load_extension 'fzf'
	end,
}
