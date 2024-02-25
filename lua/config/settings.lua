local opt = vim.opt

opt.hlsearch = true

-- Enable mouse mode
opt.mouse = 'a'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = false

-- Configuración de los números de líne a y los elementos en ella
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
	eob = ' '
}

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

-- Undo tree, habilitar la creación archivo para guardar el historial de cambios
opt.undofile = true
opt.undolevels = 10000

-- interfase
opt.guicursor = 'i-ci:ver100-Cursor-blinkwait300-blinkon200-blinkoff150' -- cursor en insert mode
opt.scrolloff = 4 -- Lineas visibles arriba y abaj apartir del cursor cuando se hace scroll
opt.backspace = 'start,eol,indent' -- Comportamiento del backspace cuando llega a borde
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.colorcolumn = '80'

-- indentado
opt.expandtab = false -- true -> Espacios en lugar de tabs
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.breakindent = true
opt.ai = true -- auto indentado

-- Text wrap
opt.linebreak = true
opt.showbreak = '    ' -- Make it so that long lines wrap smartly
opt.wrap = false -- Disable line wrap
