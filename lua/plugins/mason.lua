return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = function()
			local mason = require('mason')
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = 'rounded'
				},
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local mason_lspconfig = require('mason-lspconfig')
			mason_lspconfig.setup({
				-- list of servers for mason to install
				ensure_installed = {
					'tsserver',
					'html',
					'cssls',
					'emmet_ls',
					'lua_ls',
					'jsonls',
					'bashls',
				},
			})
		end
	}
}
