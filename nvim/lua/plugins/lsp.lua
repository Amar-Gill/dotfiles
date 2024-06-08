return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvimtools/none-ls.nvim",
			"ray-x/lsp_signature.nvim", -- show lsp signature in insert mode when calling a function
			"williamboman/mason.nvim", -- external dependencies manager
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim", -- LSP status updates
		},
		config = function()
			require("amar.config.lsp")
		end,
	},

	-- breadcrumbs
	{ "SmiteshP/nvim-navic", lazy = true },
}
