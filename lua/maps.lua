vim.g.mapleader = ' '

local keymap = vim.keymap

--No yankear el caracter cuando uso x
keymap.set('n', 'x', '"_x')

-- Incrementar o disminuir en 1 algún número cuando estoy en modo normal
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Tabs y ventanas
keymap.set('n', '<leader>t', ':tabedit<RNturn>', { silent = true }) -- Nuevo tab
keymap.set('n', '<leader>v', ':vsplit<Return><C-w>w', { silent = true }) -- Nueva ventana vertical

-- Abrir o cerrar el explorador de archivos
keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
