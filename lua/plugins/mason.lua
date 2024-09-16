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
				ensure_installed = {
					'html',
					'cssls',
					'emmet_ls',
					'lua_ls',
					'jsonls',
					'bashls',
					'ts_ls',
				},
			})
		end
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require('mason-tool-installer')

			mason_tool_installer.ensure_installed = {
				"prettier",
				"stylua",
			}
		end
	}
}
