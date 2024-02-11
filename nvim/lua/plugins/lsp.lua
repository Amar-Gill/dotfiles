return {
	"neovim/nvim-lspconfig", -- enable lsp
	"nvimtools/none-ls.nvim",
	"ray-x/lsp_signature.nvim", -- show lsp signature in insert mode when calling a function
	"folke/neodev.nvim", -- annotations for vim and plugins (requires sumneko_lua ls)
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim", -- external dependencies manager
	{ "j-hui/fidget.nvim" }, -- LSP status updates

	-- breadcrumbs
	"SmiteshP/nvim-navic",
}
