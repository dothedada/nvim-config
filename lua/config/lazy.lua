local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		vim.fn.system {
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path,
		}
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	-- lazy.install(lazy.path) -- descomentar sólo cuando lazy no esté instalado

	vim.opt.rtp:prepend(lazy.path)

	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup { { import = 'plugins' } }
