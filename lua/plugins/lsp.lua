return {
	{
		'neovim/nvim-lspconfig',

		opts = {
			servers = {
				lua_ls = {},
				ts_ls = {},
				pylsp = {},
				html = {},
				emmet_ls = {},
				bashls = {},
				cssls = {},
			}
		},

		config = function(_, opts)
			local lspconfig = require('lspconfig')
			for server, config in pairs(opts.servers) do
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end
	}
}
