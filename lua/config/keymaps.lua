local map = vim.keymap.set

-- Globales
map('n', '<leader>e', '<cmd>Explore<CR>', { desc = 'Abrir newtr' })
map('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Ejecutar el archivo' })
map('v', '<leader>x', '<cmd>:lua<CR>', { desc = 'Ejecuta seleccion en Lua' })

-- Edición de texto
map('n', 'x', '"_x', {desc = "Eliminar caracter sin hacerle yank"})
map('n', '<leader>rs', ':noh<CR>', { desc = 'Borrar marcacion de cadena buscada'})
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Mover seleccion una línea arriba'})
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Mover seleccion una línea abajo'})
map('n', '<leader>tw', ':set wrap! <CR>', { desc = 'Aplicar o no el salto de línea'})
map({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Mover dentro de la línea texto hacia arriba', expr = true, silent = true })
map({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Mover dentro de la línea texto hacia abajo', expr = true, silent = true })
map('n', '+', '<C-a>', {desc = 'Incrementar número en 1', noremap = true})
map('n', '-', '<C-x>', {desc = 'Reducir número en 1', noremap = true})
