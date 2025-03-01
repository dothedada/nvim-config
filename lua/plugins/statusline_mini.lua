return {
	{
		'echasnovski/mini.icons',
		version = '*',
		config = function()
			require('mini.icons').setup()
		end,
	},
	{
		'echasnovski/mini.statusline',
		version = '*',
		config = function()
			local data = function()
				local mode, mode_hl =
					MiniStatusline.section_mode { trunc_width = 120 }
				local git = MiniStatusline.section_git { trunc_width = 40 }
				local diagnostics = MiniStatusline.section_diagnostics {
					signs = {
						ERROR = ' ',
						WARN = ' ',
						INFO = ' ',
						HINT = ' ',
					},
				}
				local filename = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.') --					MiniStatusline.section_filename { trunc_width = 1000 }
				local fileinfo =
					MiniStatusline.section_fileinfo { trunc_width = 120 }
				local location =
					MiniStatusline.section_location { trunc_width = 120 }

				return MiniStatusline.combine_groups {
					{ hl = mode_hl, strings = { mode } },
					{
						hl = 'MiniStatuslineDevinfo',
						strings = {
							git,
						},
					},
					'%<',
					{ hl = 'MiniStatuslineFilename', strings = { filename } },
					'%=',
					{
						hl = mode_hl,
						strings = { diagnostics },
					},
					{
						hl = 'MiniStatuslineFileinfo',
						strings = { fileinfo },
					},
					{
						hl = mode_hl,
						strings = {
							location,
						},
					},
				}
			end
			require('mini.statusline').setup {
				content = { active = data },
			}
		end,
	},
}
