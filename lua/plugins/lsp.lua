return {
	{
		'neovim/nvim-lspconfig',

		opts = {
			servers = {
				lua_ls = {},
				html = {},
				cssls = {},
				ts_ls = {
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
				emmet_ls = {
					filetypes = {
						'html',
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

			-- Presentacion del  diagnostico
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
