print("old version")
require("config.keymaps")
require("config.settings")
require("config.commands")
require("config.lazy")

pcall(vim.cmd.colorscheme, "catppuccin")
