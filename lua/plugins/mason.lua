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
					'bashls', -- lsp
					'black', -- f
					'biome', -- l
					'clang-format', -- f
					'cpplint', -- l
					'cssls', -- lsp
					'emmet_ls', -- lsp
					'eslint', -- l
					'flake8', -- l
					'html', -- lsp
					'lua_ls', -- lsp
					'markdownlint', -- f
					'prettier', -- f
					'pylsp', -- lsp
					'shellcheck', -- l
					'shfmt', -- f
					'stylua', -- f
					'ts_ls', -- lsp
				},
				automatic_installation = true,
			}
		end,
	},
}
