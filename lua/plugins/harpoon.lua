return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    requires = { "nvim-lua/plenary.nvim" }, 
    conf = function() require("harpoon").setup({}) end,
}
