local state = {
	window = {
		buf = -1,
		win = -1,
	},
}

local function create_bottom_window(opts)
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
		vim.opt.number = false
		vim.opt.relativenumber = false
	end

	vim.cmd 'botright 15split'

	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, buf)

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.window.win) then
		state.window = create_bottom_window { buf = state.window.buf }
		if vim.bo[state.window.buf].buftype ~= 'terminal' then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.window.win)
	end
end

vim.api.nvim_create_user_command('Miniterm', toggle_terminal, {})
