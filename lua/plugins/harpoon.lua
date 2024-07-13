return {
	'ThePrimeagen/harpoon',

	branch = 'harpoon2',
	lazy = false,
	requires = { 'nvim-lua/plenary.nvim' },
	conf = function()
		require('harpoon').setup {
			-- save_on_ui_close = true,
			-- save_on_toggle = true
		}
	end,
}
