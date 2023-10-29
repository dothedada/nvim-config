local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    --vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    --vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup()
require("mason-lspconfig").setup {
    ensure_installed = {
	    "astro",
	    "cssls",
        "cssmodules_ls",
        --"unocss",
	    "eslint",
	    "emmet_language_server",
	    --"emmet_ls",
	    "html",
	    "biome",
	    "quick_lint_js",
	    "tsserver",
	    --"vtsls",
	    "lua_ls",
        "jsonls"
    },
}

require("lspconfig").astro.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").cssmodules_ls.setup {}
--require("lspconfig").unocss.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").emmet_language_server.setup {}
--require("lspconfig").emmet_ls.setup {}
require("lspconfig").html.setup {}
require("lspconfig").biome.setup {}
require("lspconfig").quick_lint_js.setup {}
require("lspconfig").tsserver.setup {}
--require("lspconfig").vtsls.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").jsonls.setup{}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
    },
    -- formatting = lsp_zero.cmp_format(),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = require('lspkind').cmp_format({
            -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            mode = 'symbol_text',
            preset = 'codicons',
            symbol_map = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            },
        })
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Return>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

