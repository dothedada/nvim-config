return {
	'b0o/incline.nvim',

	opts = {
		window = {
			padding = 0,
			margin = { horizontal = 0 },
		},
		render = function(props)
			local filename =
				vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
			local ft_icon =
				require('nvim-web-devicons').get_icon_color(filename)
			local modified = vim.bo[props.buf].modified
			if props.focused == true then
				local buffer = {
					ft_icon and {
						' ',
						ft_icon,
						-- guibg = '#1d2021',
						guifg = '#ecdbb2',
					} or '',
					' ',
					{ filename, gui = modified and 'bold,italic' or 'bold' },
					' ',
					guibg = '#1d2021',
				}
				return buffer
			end
		end,
	},
	-- Optional: Lazy load Incline
	event = 'VeryLazy',
}
