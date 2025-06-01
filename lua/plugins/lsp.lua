return {
	{
		'neovim/nvim-lspconfig',

		opts = {
			servers = {
				-- bashls = {
				-- 	filetypes = { 'sh', 'zsh' },
				-- 	settings = {
				-- 		completions = {
				-- 			completeFunctionCalls = true,
				-- 		},
				-- 	},
				-- },
				clangd = {},
				lua_ls = {},
				html = {
					filetypes = {
						'html',
						'liquid',
						'ejs',
					},
					init_options = {
						provideFormatter = false,
					},
				},
				cssls = {},
				taplo = {},
				ts_ls = {},
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = 'strict', -- o "strict"
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
				emmet_language_server = {
					filetypes = {
						'html',
						'ejs',
						'liquid',
						'css',
						'sass',
						'scss',
						'less',
						'javascriptreact',
						'typescriptreact',
					},
				},
				gopls = {
					settings = {
						gopls = {
							-- Desactivar análisis que hace golangci-lint
							analyses = {
								unusedparams = false, -- Parámetros no usados
								shadow = false, -- Variables sombreadas
								unusedwrite = false, -- Escrituras no usadas
								useany = false, -- Usar any en lugar de interface{}
							},
							staticcheck = false, -- Desactivar staticcheck integrado
							vulncheck = 'Off', -- Desactivar verificación de vulnerabilidades
						},
					},
				},
			},
		},

		config = function(_, opts)
			local lspconfig = require 'lspconfig'
			for server, config in pairs(opts.servers) do
				config.capabilities = require('blink.cmp').get_lsp_capabilities(
					config.capabilities
				)
				lspconfig[server].setup(config)
			end

			vim.diagnostic.config {
				virtual_text = {
					spacing = 4,
					source = 'if_many',
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = ' ',
						[vim.diagnostic.severity.WARN] = ' ',
						[vim.diagnostic.severity.HINT] = '󰠠 ',
						[vim.diagnostic.severity.INFO] = ' ',
					},
				},
				update_in_insert = false,
				severity_sort = true,
			}
		end,
	},
}
