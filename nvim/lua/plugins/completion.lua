return {
	-- The completion plugin
	{
		"hrsh7th/nvim-cmp",
		dependencies = {

			"hrsh7th/cmp-nvim-lsp", -- lsp completion source
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- command line completions
		},
	},

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"saadparwaiz1/cmp_luasnip", -- snippet completions

	-- copilot
	"github/copilot.vim",
}
