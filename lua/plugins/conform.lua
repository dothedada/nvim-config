return {
	'stevearc/conform.nvim',

	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require 'conform'

		conform.setup {
			formatters_by_ft = {
				['bash'] = { 'shfmt' },
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
				['markdown'] = { 'mdformat' },
				['markdown.mdx'] = { 'mdformat' },
				['graphql'] = { 'prettier' },
				['handlebars'] = { 'prettier' },
				['lua'] = { 'stylua' },
				['python'] = { 'black' },
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
