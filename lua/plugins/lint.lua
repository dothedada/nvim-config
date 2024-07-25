return {
	'mfussenegger/nvim-lint',
	event = {
		'BufReadPre',
		'BufNewFile',
	},

	config = function()
		local lint = require('lint')

		lint.linters_by_ft = {
			bash = { 'bash-language-server' },
			zsh = { 'bash-language-server' },
			javascript = { 'biome' },
			typescript = { 'biome' },
			javascriptreact = { 'eslint' },
			typescriptreact = { 'eslint' },
			svelte = { 'eslint' },
			vue = { 'eslint' },
		}

		local lint_augroup =
			vim.api.nvim_create_augroup('lint', { clear = true })

		vim.api.nvim_create_autocmd(
			{ 'BufEnter', 'BufWritePost', 'InsertLeave' },
			{
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			}
		)

		vim.keymap.set('n', '<leader>lt', function()
			lint.try_lint()
		end)
	end,

	enabled = false
}
