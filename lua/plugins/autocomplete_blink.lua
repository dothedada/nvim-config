return {
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',
		version = '*',
		opts = {
			sources = {
				priority = { -- deduplicate elements
					'lsp',
					'snippets',
					'path',
				},
				default = {
					'lsp',
					'snippets',
					'buffer',
					'path',
					'lazydev',
				},
				providers = {
					lazydev = {
						name = 'LazyDev',
						module = 'lazydev.integrations.blink',
						score_offset = 100,
					},
				},
			},
			keymap = { preset = 'default' },
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = 'mono',
			},

			completion = {
				menu = { border = 'rounded' },
				documentation = { window = { border = 'rounded' } },
			},

			signature = {
				enabled = true,
				trigger = {
					enabled = true,
				},
				window = {
					min_width = 10,
					max_width = 80,
					max_height = 50,
					border = 'rounded',
					-- scrollbar = true,
					treesitter_highlighting = true,
					show_documentation = true,
				},
			},
		},
		-- deduplicate
		config = function(_, opts)
			local original = require('blink.cmp.completion.list').show
			---@diagnostic disable-next-line: duplicate-set-field
			require('blink.cmp.completion.list').show = function(
				ctx,
				items_by_source
			)
				local seen = {}
				local function filter(item)
					if seen[item.label] then
						return false
					end
					seen[item.label] = true
					return true
				end
				for id in vim.iter(opts.sources.priority) do
					items_by_source[id] = items_by_source[id]
						and vim.iter(items_by_source[id])
							:filter(filter)
							:totable()
				end
				return original(ctx, items_by_source)
			end
			require('blink.cmp').setup(opts)
		end,
		opts_extend = { 'sources.default' },
	},
}
