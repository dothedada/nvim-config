local miniterm = {
	state = {
		buf = -1,
		win = -1,
	},

	config = {
		height = 10,
		position = 'botright',
		enter_insert = true,

		win_opts = {
			number = false,
			relativenumber = false,
			signcolumn = 'no',
			cursorline = false,
		},
	},
}

function miniterm.create_window(opts)
	local buf = nil

	if opts and opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	vim.cmd(
		string.format(
			'%s %dsplit',
			miniterm.config.position,
			miniterm.config.height
		)
	)

	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, buf)

	for option, value in pairs(miniterm.config.win_opts) do
		vim.api.nvim_set_option_value(option, value, { win = win })
	end

	return { win = win, buf = buf }
end

function miniterm.toggle()
	if
		miniterm.state.win ~= -1
		and vim.api.nvim_win_is_valid(miniterm.state.win)
	then
		vim.api.nvim_win_hide(miniterm.state.win)
		return
	end

	miniterm.state = miniterm.create_window { buf = miniterm.state.buf }

	if vim.bo[miniterm.state.buf].buftype ~= 'terminal' then
		vim.cmd.terminal()
	end

	if miniterm.config.enter_insert then
		vim.cmd 'startinsert'
	end
end

vim.api.nvim_create_user_command('Miniterm', miniterm.toggle, {})

return miniterm
