return {
	-- The completion plugin
	{
		"hrsh7th/nvim-cmp",
		event = { "VeryLazy" },
		dependencies = {

			"hrsh7th/cmp-nvim-lsp", -- lsp completion source
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- command line completions
			"onsails/lspkind-nvim", -- vscode-like pictograms
			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				dependencies = {

					"rafamadriz/friendly-snippets",
					"saadparwaiz1/cmp_luasnip", -- snippet completions
				},
				config = function()
					require("amar.config.snippets")
				end,
			},
		},
		config = function()
			require("amar.config.lspkind")
			require("amar.config.cmp")
		end,
	},

	-- copilot
	"github/copilot.vim",
}
