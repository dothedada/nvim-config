return {
	'stevearc/conform.nvim',

	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require 'conform'

		conform.setup {
			formatters_by_ft = {
				['javascript'] = { 'prettier' },
				['javascriptreact'] = { 'prettier' },
				['typescript'] = { 'prettier' },
				['typescriptreact'] = { 'prettier' },
				['vue'] = { 'prettier' },
				['css'] = { 'prettier' },
				['scss'] = { 'prettier' },
				['less'] = { 'prettier' },
				['html'] = { 'prettier' },
				['json'] = { 'prettier' },
				['jsonc'] = { 'prettier' },
				['yaml'] = { 'prettier' },
				['markdown'] = { 'prettier' },
				['markdown.mdx'] = { 'prettier' },
				['graphql'] = { 'prettier' },
				['handlebars'] = { 'prettier' },
				['lua'] = { 'stylua' },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		}
	end,
	opts = {},
}
