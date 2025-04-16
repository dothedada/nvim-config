local glob = vim.g
local opt = vim.opt

-- Configuracion global
glob.mapleader = ' '
glob.maplocalleader = '//'
opt.confirm = true
opt.termguicolors = true
opt.hlsearch = true
opt.mouse = 'a'
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = 'unnamedplus'
opt.undofile = true
opt.undolevels = 10000

-- Información columna de la izquierda
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.fillchars = {
	foldopen = '',
	foldclose = '',
	-- fold = "⸱",
	fold = ' ',
	foldsep = ' ',
	diff = '╱',
	eob = ' ',
}

-- Configuracion ventana principal
-- Indentación
opt.shiftwidth = 4
opt.expandtab = false -- true -> Espacios en lugar de tabs
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.breakindent = true
opt.ai = true -- auto indentado

-- Navegacion y ventana principal
opt.colorcolumn = '80'
opt.winblend = 1

opt.scrolloff = 4 -- Lineas visibles arriba y abaj apartir del cursor cuando se hace scroll
opt.backspace = 'start,eol,indent' -- Comportamiento del backspace cuando llega a borde
opt.linebreak = true
opt.showbreak = '>   ' -- Make it so that long lines wrap smartly
opt.breakindent = true
opt.ai = true -- auto indentado
opt.completeopt = 'menuone,noselect' -- Autocompletado
-- opt.wrap = false -- Disable line wrap

-- Interfase
opt.cursorline = true -- Enable highlighting of the current line
opt.guicursor = 'i-ci:ver100-Cursor-blinkwait300-blinkon200-blinkoff150' -- cursor en insert mode
vim.api.nvim_create_autocmd('textYankPost', {
	desc = 'Resaltado al copiar texto',
	group = vim.api.nvim_create_augroup('Resaltado', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
opt.pumblend = 0
opt.winblend = 0
