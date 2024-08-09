return {
	'mfussenegger/nvim-lint',
	event = {
		'BufReadPre',
		'BufNewFile',
	},

	config = function()
		local lint = require('lint')
		local linterJS = {}

		local biomeAvailable = vim.fn.isdirectory(vim.fn.getcwd() .. '/node_modules/@biomejs')
		local eslintAvailable = vim.fn.isdirectory(vim.fn.getcwd() .. '/node_modules/@eslint')

		if biomeAvailable == 1 then
			table.insert(linterJS, 'biomejs')
		elseif eslintAvailable == 1 then
			table.insert(linterJS, 'eslint')
		end

		lint.linters_by_ft['javascript'] = linterJS
		lint.linters_by_ft['typescript'] = linterJS
		lint.linters_by_ft['javascriptreact'] = { 'eslint' }
		lint.linters_by_ft['typescriptreact'] = { 'eslint' }
		lint.linters_by_ft['svelte'] = { 'eslint' }
		lint.linters_by_ft['vue'] = { 'eslint' }

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
	end,
	-- enabled = false
}
