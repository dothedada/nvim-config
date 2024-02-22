return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		position = "right", -- position of the list can be: bottom, top, left, right
		width = 40, -- width of the list when position is left or right
		signs = {
			-- icons / text used for a diagnostic
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
		use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
	},
}
