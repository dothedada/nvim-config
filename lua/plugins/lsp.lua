return {
	{
		'neovim/nvim-lspconfig',

		opts = {
			servers = {
				clangd = {},
				lua_ls = {},
				html = {
					filetypes = {
						'html',
						'liquid',
						'ejs',
					},
				},
				cssls = {},
				taplo = {},
				ts_ls = {
					filetypes = {
						'javascript',
						'typescript',
						'javascriptreact',
						'typescriptreact',
					},

					-- Eliminar diagnosticos duplicados
					init_options = {
						diagnostics = false,
					},
				},
				pylsp = {
					-- Eliminar diagnosticos duplicados
					handlers = {
						['textDocument/publishDiagnostics'] = function() end,
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
				bashls = {
					filetypes = { 'sh', 'zsh' },
					settings = {
						completions = {
							completeFunctionCalls = true,
						},
					},
				},
				gopls = {},
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

			local signs = {
				Error = ' ',
				Warn = ' ',
				Hint = '󰠠 ',
				Info = ' ',
			}

			for type, icon in pairs(signs) do
				local hl = 'DiagnosticSign' .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
			end

			vim.diagnostic.config {
				virtual_text = {
					spacing = 4,
					source = 'if_many',
				},
				severity_sort = true,
			}
		end,
	},
}
