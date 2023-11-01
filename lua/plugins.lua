local status, packer = pcall(require, 'packer')
if (not status) then
    print ('Packer no está instalado')
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    -- inicia el administrador de paquetes
    use 'wbthomason/packer.nvim'

    -- inicia el estilo
    use { "catppuccin/nvim", as = "catppuccin" }
    -- Inicia los íconos
    use 'kyazdani42/nvim-web-devicons'

    -- árbol de archivos
    use 'kyazdani42/nvim-tree.lua'

    -- Barra inferior de estado
    use 'hoob3rt/lualine.nvim'

    -- Interfase de usuario y LSP en esteroides
    use 'nvimdev/lspsaga.nvim'

    -- LSPs
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- Pictogramas LSP
    use 'onsails/lspkind-nvim'

    -- Barras de indentado
    use 'lukas-reineke/indent-blankline.nvim'

    -- Cierre de paréntesis y comillas automático
    use 'windwp/nvim-autopairs'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use('nvim-treesitter/playground')

    -- Buscador con previsualización de archivos - Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Referencias de color - Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Git
    use 'lewis6991/gitsigns.nvim' --signs, los cositos que van a la izq del indentado
    use 'dinhhuy258/git.nvim' --Servidor de Git

    -- Marcar comentarios
    use 'numToStr/Comment.nvim'

end)
