local map = vim.keymap.set

-- Globales
map('n', '<leader>e', '<cmd>Explore<CR>') -- Abrir newtr
map('n', '<leader><leader>x', '<cmd>source %<CR>') -- Ejecutar el archivo
map('v', '<leader>x', '<cmd>:lua<CR>') -- Ejecuta seleccion en Lua

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
map('n', '<leader>ff', require('telescope.builtin').find_files) -- Finder Raíz
map('n', '<leader>fr', require('telescope.builtin').lsp_references) -- Finder LSP
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
