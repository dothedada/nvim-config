return {
	'stevearc/conform.nvim',

	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require 'conform'

		conform.setup {
			formatters_by_ft = {
				['c'] = { 'clang-format' },
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
				['markdown'] = { 'markdownlint' },
				['markdown.mdx'] = { 'markdownlint' },
				['graphql'] = { 'prettier' },
				['handlebars'] = { 'prettier' },
				['lua'] = { 'stylua' },
				['python'] = { 'black' },
				['toml'] = { 'taplo' },
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 500,
			},
		}
	end,
	opts = {},
}
