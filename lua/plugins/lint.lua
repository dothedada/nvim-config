return {
	'mfussenegger/nvim-lint',
	event = {
		'BufReadPre',
		'BufNewFile',
	},

	config = function()
		local lint = require 'lint'
		local projectLint = {}

		local fileType = vim.bo.filetype
		if fileType == 'javascript' or fileType == 'javascript' then
			if vim.fn.isdirectory 'node_modules/@biomejs' == 1 then
				table.insert(projectLint, 'biomejs')
			elseif vim.fn.isdirectory 'node_modules/@eslint' == 1 then
				table.insert(projectLint, 'eslint')
			end

			if #projectLint == 0 then
				print 'Sin lint personalizado en node_modules'
			else
				print('linteo personalizado de JS/TS con: ' .. projectLint[1])
			end
		end

		lint.linters_by_ft = {
			javascript = projectLint,
			typescript = projectLint,
			javascriptreact = { 'eslint' },
			typescriptreact = { 'eslint' },
			svelte = { 'eslint' },
			vue = { 'eslint' },
			bash = { 'shellcheck' },
			python = { 'flake8' },
			c = { 'cpplint' },
			-- html = { 'curlylint' },
			-- ejs = { 'curlylint' },
			-- go = { 'golangci-lint' },
		}

		local lint_augroup =
			vim.api.nvim_create_augroup('lint', { clear = true })

		vim.api.nvim_create_autocmd(
			{ 'bufenter', 'bufwritepost', 'insertleave' },
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
