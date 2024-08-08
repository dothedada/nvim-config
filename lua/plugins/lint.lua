return {
	'mfussenegger/nvim-lint',
	event = {
		'BufReadPre',
		'BufNewFile',
	},

	config = function()
		local lint = require('lint')

		lint.linters_by_ft['markdown'] = { 'markdownlint' }
		lint.linters_by_ft['bash'] = { 'bash-language-server' }
		lint.linters_by_ft['zsh'] = { 'bash-language-server' }
		lint.linters_by_ft['javascript'] = { 'biome' }
		lint.linters_by_ft['typescript'] = { 'biome' }
		lint.linters_by_ft['javascriptreact'] = { 'eslint' }
		lint.linters_by_ft['typescriptreact'] = { 'eslint' }
		lint.linters_by_ft['svelte'] = { 'eslint' }
		lint.linters_by_ft['vue'] = { 'eslint' }

		local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
