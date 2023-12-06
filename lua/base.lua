-- ni idea
vim.cmd('autocmd!')
-- codificación de los archivos
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding ='utf-8'
-- mostrar los números relativos de línea
vim.opt.nu = true
vim.opt.relativenumber = true

-- cursor en insert mode
vim.opt.guicursor = "i-ci:ver100-Cursor-blinkwait300-blinkon200-blinkoff150"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
-- op
vim.opt.backup = false

vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
--
vim.opt.scrolloff = 5
vim.opt.colorcolumn = "90"
--
-- vim.opt.shell = 'fish'

-- indentado
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.ai = true -- auto indentado
vim.opt.wrap = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true

vim.opt.backspace = 'start,eol,indent'

vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
