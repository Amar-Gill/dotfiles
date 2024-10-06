return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			-- dark_variant = "moon",
			groups = {
				git_change = "gold",
				git_add = "pine",
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{ "folke/tokyonight.nvim", lazy = true, opts = { style = "storm" } },
	{ "projekt0n/github-nvim-theme", lazy = true },
	{ "olivercederborg/poimandres.nvim", lazy = true },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = { flavour = "auto", background = { light = "latte", dark = "mocha" } },
	},
}
