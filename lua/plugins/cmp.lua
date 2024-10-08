return {
	'hrsh7th/nvim-cmp',

	dependencies = {
		{
			'L3MON4D3/LuaSnip',
			build = (function()
				if vim.fn.has 'win32' == 1 then
					return
				end
				return 'make install_jsregexp'
			end)(),
		},
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		-- Adds a number of user-friendly snippets
		-- 'rafamadriz/friendly-snippets',
		'onsails/lspkind-nvim',
	},
	config = function()
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'
		require('luasnip.loaders.from_vscode').lazy_load()
		luasnip.config.setup {}
		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				fields = { 'abbr', 'kind', 'menu' },
				expandable_indicator = true,
				format = require('lspkind').cmp_format {
					-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
					mode = 'symbol_text',
					preset = 'codicons',
					symbol_map = {
						Text = '󰉿',
						Method = '󰆧',
						Function = '󰊕',
						Constructor = '',
						Field = '󰜢',
						Variable = '󰀫',
						Class = '󰠱',
						Interface = '',
						Module = '',
						Property = '󰜢',
						Unit = '󰑭',
						Value = '󰎠',
						Enum = '',
						Keyword = '󰌋',
						Snippet = '',
						Color = '󰏘',
						File = '󰈙',
						Reference = '󰈇',
						Folder = '󰉋',
						EnumMember = '',
						Constant = '󰏿',
						Struct = '󰙅',
						Event = '',
						Operator = '󰆕',
						TypeParameter = '',
					},
				},
			},
			mapping = cmp.mapping.preset.insert {
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete {},
				-- ['<CR>'] = cmp.mapping.confirm {
				-- 	behavior = cmp.ConfirmBehavior.Replace,
				-- 	select = true,
				-- },
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'path' },
			},
		}
	end,
}
