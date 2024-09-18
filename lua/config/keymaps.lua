vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- Navegador de archivos
map('n', '<leader>e', ':Explore <CR>')

-- Evitar yank cuando se usa X
map('n', 'x', '"_x')

-- Borrar marcación  de cadenas buscadas
map('n', '<leader>rs', ':noh <CR>')

-- Operaciones con WrapText
map('n', '<leader>tw', ':set wrap! <CR>')
-- Salta entre la línea cuando el texto está wrapeado y no a la siguiente línea
map({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Incrementar o disminuir en 1 algún número cuando estoy en modo normal
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- Mover bloques de texto
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Evita que la barra espaciadora haga algo por sí sola en N y V modes
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Abrir el el undotree
map('n', '<C-z>', '<cmd>UndotreeToggle<cr>')

-- Harpoon
map('n', '<leader>H', function()
	require('harpoon'):list():add()
end)
map('n', '<leader>h', function()
	local harpoon = require 'harpoon'
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
map('n', '<C-p>', function()
	require('harpoon'):list():prev()
end)
map('n', '<C-n>', function()
	require('harpoon'):list():next()
end)

-- Telescope
map('n', '<leader>ff', function()
	local builtin = require 'telescope.builtin'
	builtin.find_files()
end, {})
map('n', '<leader>fg', function()
	local builtin = require 'telescope.builtin'
	builtin.live_grep()
end, {})
map('n', '<leader>fb', function()
	local builtin = require 'telescope.builtin'
	builtin.buffers()
end, {})
map('n', '<leader>fh', function()
	local builtin = require 'telescope.builtin'
	builtin.help_tags()
end, {})

-- Trouble
map('n', '<C-x>', function()
	require('trouble').toggle 'diagnostics'
end)

-- rename
map('n', '<leader>rn', function()
	vim.lsp.buf.document_highlight()
	vim.defer_fn(function()
		vim.lsp.buf.rename()
	end, 100)
	vim.lsp.buf.clear_references()
end)

-- Prettier
map({ 'n', 'v' }, '<F3>', function()
	require('conform').format {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}
end)

-- HACK: '¶' es lo que bota el teclado al hacer <A-j>, teclado mac español
vim.keymap.set('n', '¶', function()
	require('todo-comments').jump_next()
end)

-- HACK: '§' es lo que bota el teclado al hacer <A-k>, teclado mac español
vim.keymap.set('n', '§', function()
	require('todo-comments').jump_prev()
end)
