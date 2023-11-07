vim.g.mapleader = ' '

local keymap = vim.keymap

--No yankear el caracter cuando uso x
keymap.set('n', 'x', '"_x')

-- Wrapera el texto

keymap.set('n', '<leader>tw', ':set wrap!<cr>')

-- Incrementar o disminuir en 1 algún número cuando estoy en modo normal
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Tabs y ventanas
keymap.set('n', '<leader>t', ':tabedit<RNturn>', { silent = true }) -- Nuevo tab
keymap.set('n', '<leader>v', ':vsplit<Return><C-w>w', { silent = true }) -- Nueva ventana vertical

-- Abrir o cerrar el explorador de archivos
keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)

-- LSPsaga
keymap.set('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>')
keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
keymap.set('n', 'gd', '<cmd>Lspsaga finder ++normal<cr>')
keymap.set('n', 'gr', '<cmd>Lspsaga rename<cr>')
