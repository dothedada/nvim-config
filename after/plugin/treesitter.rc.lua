local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
    ensure_installed = {
        "astro",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query"
    },

    sync_install = true,
    auto_install = true,

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },

    autotag = {
        enable = true,
    },
}
