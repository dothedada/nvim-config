return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = {
					'c',
					'lua',
					'vim',
					'vimdoc',
					'query',
					'markdown',
					'markdown_inline',
				},
				modules = {},
				sync_install = false,
				ignore_install = {},
				auto_install = true,
				highlight = {
					enable = true,
					disable = function(_, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(
							vim.loop.fs_stat,
							vim.api.nvim_buf_get_name(buf)
						)
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
			}
			vim.treesitter.language.register('html', 'ejs')
			vim.treesitter.language.register('javascript', 'ejs')
		end,
	},
}
