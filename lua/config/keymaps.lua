local map = vim.keymap.set

-- Globales
map('n', '<leader>e', '<cmd>Explore<CR>') -- Abrir newtr
map('n', '<leader><leader>x', '<cmd>source %<CR>') -- Ejecutar el archivo
map('v', '<leader>x', ':lua<CR>') -- Ejecuta seleccion en Lua

-- Edición de texto
map('n', 'x', '"_x') --"Eliminar caracter sin hacerle yank"
map('n', '<leader>rs', ':noh<CR>') -- Borrar marcacion de cadena buscada
map('v', 'J', ":m '>+1<CR>gv=gv") -- Mover seleccion una línea arriba
map('v', 'K', ":m '<-2<CR>gv=gv") -- Mover seleccion una línea abajo
map('n', '<leader>tw', ':set wrap! <CR>') -- Aplicar o no el salto de línea
map(
	{ 'n', 'v' },
	'k',
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
) -- Salto de linea hacia arriba en texto wrap
map(
	{ 'n', 'v' },
	'j',
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
) -- Salto de linea hacia abajo en texto wrap
map('n', '+', '<C-a>') -- Incrementar número en 1
map('n', '-', '<C-x>') -- Reducir número en 1
map('n', '<leader>rn', function()
	vim.lsp.buf.document_highlight()
	vim.defer_fn(function()
		vim.lsp.buf.rename()
	end, 100)
	vim.lsp.buf.clear_references()
end) -- Renombra variables

-- Lint
vim.keymap.set('n', '<leader>l', function()
	require('lint').try_lint()
end)

-- Telescope
map('n', 'gd', require('telescope.builtin').lsp_definitions) -- Finder Definicion
map('n', 'gr', require('telescope.builtin').lsp_references) -- Finder Referencias
map('n', 'gt', require('telescope.builtin').lsp_type_definitions) -- Finder Tipos
map('n', '<leader>ff', require('telescope.builtin').find_files) -- Finder Raíz
map('n', '<leader>fg', require('telescope.builtin').live_grep) -- Finder Regex
map('n', '<leader>fb', require('telescope.builtin').buffers) -- Finder Buffers
map('n', '<leader>fh', require('telescope.builtin').help_tags) -- Finder Help
map('n', '<leader>cc', function()
	require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath 'config',
	}
end) -- Abre la carpeta con archivos de configuracion

-- Harpoon
map('n', '<leader>H', function()
	require('harpoon'):list():add()
end, { desc = 'Añade archivo a Harpoon' })
map('n', '<leader>h', function()
	local harpoon = require 'harpoon'
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Abre ventana de Harpoon' })
map('n', '<C-p>', function()
	require('harpoon'):list():prev()
end, { desc = 'Va al Harpoon previo' })
map('n', '<C-n>', function()
	require('harpoon'):list():next()
end, { desc = 'Va al Harpoon siguiente' })

-- undo tree
map('n', '<C-z>', vim.cmd.UndotreeToggle)

-- trouble
map('n', '<C-x>', '<cmd>Trouble diagnostics toggle<cr>') -- Abrir Trouble

-- To do
map('n', '<A-j>', function()
	require('todo-comments').jump_next()
end)
map('n', '<A-k>', function()
	require('todo-comments').jump_prev()
end)

local function show_documentation()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ 'vim', 'help' }, filetype) then
		vim.cmd('h ' .. vim.fn.expand '<cword>')
	elseif vim.tbl_contains({ 'man' }, filetype) then
		vim.cmd('Man ' .. vim.fn.expand '<cword>')
	elseif vim.fn.expand '%:t' == 'Cargo.toml' then
		require('crates').show_popup()
	else
		local params = vim.lsp.util.make_position_params()
		vim.lsp.buf_request(0, 'textDocument/hover', params, function(_, result)
			if result and result.contents then
				local lines = vim.lsp.util.convert_input_to_markdown_lines(
					result.contents
				)
				vim.lsp.util.open_floating_preview(lines, 'markdown', {
					max_width = 60,
					max_height = 50,

					border = 'rounded',
				})
			end
		end)
	end
end

-- Asignar la función a la tecla K
map('n', 'K', show_documentation, { desc = 'Mostrar documentación' })

-- Miniterminal
map({ 'n', 't' }, '<C-t>', '<cmd>Miniterm<CR>') -- abre minterminal
map('t', '<esc><esc>', '<C-\\><C-n>') -- Entra al modo vim dentro del terminal

-- Quickfix
local function quickfixopen()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			vim.cmd.cclose()
			return
		end
	end

	vim.cmd.copen()
end
map('n', '<leader>cf', quickfixopen)
map('n', '<A-c>', '<cmd>cexpr []<CR>')
map('n', '<A-n>', vim.cmd.cn)
map('n', '<A-p>', vim.cmd.cp)

-- Deshabilitar F1
map('n', '<F1>', '<Nop>')
map('i', '<F1>', '<Nop>')
map('v', '<F1>', '<Nop>')
