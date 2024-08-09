return {
	'neovim/nvim-lspconfig',

	event = { 'BufReadPre', 'BufNewFile' },

	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'antosha417/nvim-lsp-file-operations', config = true },
		{ 'folke/neodev.nvim', opts = {} },
	},

	cmd = { 'LspInfo', 'LspInstall', 'LspUnInstall' },

	config = function()
		local lspconfig = require 'lspconfig'
		local mason_lspconfig = require 'mason-lspconfig'
		local cmp_nvim_lsp = require 'cmp_nvim_lsp'

		local map = vim.keymap.set
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = 'Show LSP references'
				map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)

				opts.desc = 'Show LSP definitions'
				map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

				opts.desc = 'Show LSP type definitions'
				map('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

				opts.desc = 'See available code actions'
				map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

				opts.desc = 'Show buffer diagnostics'
				map('n', '<leader>d', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

				opts.desc = 'Go to previous diagnostic'
				map('n', '[d', vim.diagnostic.goto_prev, opts)

				opts.desc = 'Go to next diagnostic'
				map('n', ']d', vim.diagnostic.goto_next, opts)

				opts.desc = 'Show documentation for what is under cursor'
				map('n', 'K', vim.lsp.buf.hover, opts)

				opts.desc = 'Restart LSP'
				map('n', '<leader>rs', ':LspRestart<CR>', opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Diagnostics
		local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
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

		mason_lspconfig.setup_handlers {
			function(server_name)
				lspconfig[server_name].setup {
					capabilities = capabilities,
				}
			end,

			['emmet_ls'] = function()
				lspconfig['emmet_ls'].setup {
					capabilities = capabilities,
					filetypes = {
						'html',
						'typescriptreact',
						'javascriptreact',
						'css',
						'sass',
						'scss',
						'less',
						'svelte',
					},
				}
			end,

			['bashls'] = function()
				lspconfig.bashls.setup {
					capabilities = capabilities,
					filetypes = { 'sh', 'zsh' },
					settings = {
						completions = {
							completeFunctionCalls = true,
						},
					},
				}
			end,

			['tsserver'] = function()
				lspconfig.tsserver.setup {
					capabilities = capabilities,
					settings = {
						completions = {
							completeFunctionCalls = true,
						},
					},
				}
			end,

			['lua_ls'] = function()
				require 'plugins.lsp.lua_ls'
			end,
		}
	end,
}
-- local Plugin = {
-- 	'neovim/nvim-lspconfig',
--
-- 	dependencies = {
-- 		{ 'hrsh7th/cmp-nvim-lsp' },
-- 		{ 'williamboman/mason-lspconfig.nvim' },
-- 	},
-- 	cmd = { 'LspInfo', 'LspInstall', 'LspUnInstall' },
-- 	event = { 'BufReadPre', 'BufNewFile' },
-- }
--
-- local user = {}
--
-- function Plugin.init()
-- 	local sign = function(opts)
-- 		-- See :help sign_define()
-- 		vim.fn.sign_define(opts.name, {
-- 			texthl = opts.name,
-- 			text = opts.text,
-- 			numhl = '',
-- 		})
-- 	end
--
-- 	sign { name = 'DiagnosticSignError', text = '✘' }
-- 	sign { name = 'DiagnosticSignWarn', text = '▲' }
-- 	sign { name = 'DiagnosticSignHint', text = '⚑' }
-- 	sign { name = 'DiagnosticSignInfo', text = '»' }
--
--
-- 	vim.lsp.handlers['textDocument/hover'] =
-- 		vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
--
-- 	vim.lsp.handlers['textDocument/signatureHelp'] =
-- 		vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
-- end
--
-- function Plugin.config()
-- 	local lspconfig = require 'lspconfig'
-- 	local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- 	local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })
--
-- 	vim.api.nvim_create_autocmd('LspAttach', {
-- 		group = group,
-- 		desc = 'LSP actions',
-- 		callback = user.on_attach,
-- 	})
-- end
--
-- function user.on_attach()
-- 	local bufmap = function(mode, lhs, rhs)
-- 		local opts = { buffer = true }
-- 		vim.keymap.set(mode, lhs, rhs, opts)
-- 	end
--
-- 	-- Muestra la documentación sobre el símbolo en el que se encuentra el cursor
-- 	bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
--
-- 	-- Ventana con la definición
-- 	bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
--
-- 	-- Salta a las declaraciones
-- 	bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
--
-- 	-- Muestra las implementaciones del símbolo en el que se encuentra el cursor
-- 	bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
--
-- 	-- Abre un listado con todas las referencias a lo que se encuentra bajo el cursor
-- 	bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
--
-- 	-- Muestra una guía basada en la documentación del símbolo
-- 	bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
--
-- 	-- renombra
-- 	-- bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
-- 	-- Autoformatea
-- 	-- bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
-- 	-- permite seleccionar una acción de código
-- 	bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
--
-- 	--abre una ventana flotante con los diagnosticos
-- 	bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
-- 	bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
-- 	bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
-- end
--
-- return Plugin
