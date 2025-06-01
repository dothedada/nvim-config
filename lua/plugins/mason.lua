return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = function()
			local mason = require 'mason'
			mason.setup {
				ui = {
					icons = {
						package_installed = '✓',
						package_pending = '➜',
						package_uninstalled = '✗',
					},
					border = 'rounded',
				},
			}
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			local mason_lspconfig = require 'mason-lspconfig'
			mason_lspconfig.setup {
				ensure_installed = {
					'bashls', --lsp
					'cssls', -- lsp
					'emmet_ls', -- lsp
					'eslint', -- l
					'html', -- lsp
					'lua_ls', -- lsp
					'ts_ls', -- lsp
					'ruff', -- lint
					'pyright', -- lsp
				},
				automatic_enable = true,
				automatic_installation = true,
			}
		end,

		vim.filetype.add { extension = { ejs = 'ejs' } },
		vim.filetype.add { extension = { liquid = 'liquid' } },
	},
}
