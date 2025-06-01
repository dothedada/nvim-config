return {
	'mfussenegger/nvim-lint',
	event = {
		'BufReadPre',
		'BufNewFile',
	},

	config = function()
		local lint = require 'lint'

		lint.linters_by_ft = {
			markdown = { 'markdownlint' },
			bash = { 'shellcheck' }, -- Agregar esta línea
			sh = { 'shellcheck' }, -- Agregar esta línea
			zsh = { 'shellcheck' },
			python = { 'ruff' },
			go = { 'golangci-lint' },
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

	-- enabled = false,
}
