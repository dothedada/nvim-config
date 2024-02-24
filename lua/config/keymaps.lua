vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- Navegador de archivos
map('n', '<leader>e', ':Explore <CR>')

-- Evitar yank cuando se usa X
map('n', 'x', '"_x')

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
map('n', '<leader>z', '<cmd>UndotreeToggle<cr>')

-- Harpoon
map('n', '<C-x>', function()
	require('harpoon'):list():append()
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
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>d', function()
	require('telescope').extensions.file_browser.file_browser {
		path = '%:p:h',
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = 'normal',
		sorting_strategy = 'ascending',
		layout_strategy = 'horizontal',
		layout_config = {
			prompt_position = 'top',
			width = 80,
			height = 30,
		},
		border = true,
	}
end)

-- Trouble
map('n', '<leader>xx', function()
	require('trouble').toggle()
end)
map('n', '<leader>xw', function()
	require('trouble').toggle 'workspace_diagnostics'
end)
map('n', '<leader>xd', function()
	require('trouble').toggle 'document_diagnostics'
end)
map('n', '<leader>xq', function()
	require('trouble').toggle 'quickfix'
end)
map('n', '<leader>xl', function()
	require('trouble').toggle 'loclist'
end)
map('n', 'gR', function()
	require('trouble').toggle 'lsp_references'
end)

-- rename
map('n', '<leader>rn', ':IncRename ')

-- Prettier
map({ 'n', 'v' }, '<F3>', function()
	require('conform').format {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}
end)

-- HACK: '¶' es lo que bota el teclado al hacer <A-j>
vim.keymap.set('n', '¶', function()
	require('todo-comments').jump_next()
end)

-- HACK: '§' es lo que bota el teclado al hacer <A-k>
vim.keymap.set('n', '§', function()
	require('todo-comments').jump_prev()
end)
