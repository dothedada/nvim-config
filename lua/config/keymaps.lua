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
	'j',
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
) -- Mover dentro de la línea texto hacia arriba
map(
	{ 'n', 'v' },
	'k',
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
) -- Mover dentro de la línea texto hacia abajo
map('n', '+', '<C-a>') --Incrementar número en 1, noremap = true
map('n', '-', '<C-x>') --Reducir número en 1, noremap = true

-- Telescope
map('n', '<leader>ff', require('telescope.builtin').find_files) -- Busca archivos desde la raiz del proyecto
map('n', '<leader>fr', require('telescope.builtin').lsp_references) -- Busca referencias en el LSP
map('n', '<leader>fg', require('telescope.builtin').live_grep) -- Busca expresion dentro de los archivos del directorio
map('n', '<leader>fb', require('telescope.builtin').buffers) -- Muestra los buffers abiertos
map('n', '<leader>fh', require('telescope.builtin').help_tags) -- Busca dentro de la documentacion de ayuda
map('n', '<leader>cc', function()
	require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath 'config',
	}
end) -- Abre la carpeta con archivos de configuracion
