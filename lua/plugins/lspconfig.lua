return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ 'williamboman/mason-lspconfig.nvim' },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim",                   opts = {} },
	},
	cmd = { 'LspInfo', 'LspInstall', 'LspUnInstall' },

	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Diagnostics
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config {
			virtual_text = {
				spacing = 4,
				source = 'if_many',
			},
			severity_sort = true,
		}

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
				})
			end,
			['bashls'] = function()
				lspconfig.bashls.setup {
					capabilities = capabilities,
					filetypes = { 'sh', 'zsh' },
					settings = {
						completions = {
							completeFunctionCalls = true
						}
					}
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
		})
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
--
-- 	require('mason-lspconfig').setup {
-- 		handlers = {
-- 			function(server)
-- 				lspconfig[server].setup {
-- 					capabilities = lsp_capabilities,
-- 				}
-- 			end,
-- 			-- Con esta funcion se activa eslint en los archivos que son revisados con eslint
-- 			['bashls'] = function()
-- 				lspconfig.bashls.setup{
-- 					capabilities =lsp_capabilities,
-- 					filetypes = {'sh', 'zsh'},
-- 					settings = {
-- 						completions = {
-- 							completeFunctionCalls = true
-- 						}
-- 					}
-- 				}
-- 			end,
-- 			['tsserver'] = function()
-- 				lspconfig.tsserver.setup {
-- 					capabilities = lsp_capabilities,
-- 					settings = {
-- 						completions = {
-- 							completeFunctionCalls = true,
-- 						},
-- 					},
-- 				}
-- 			end,
-- 			['lua_ls'] = function()
-- 				require 'plugins.lsp.lua_ls'
-- 			end,
-- 		},
-- 	}
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
