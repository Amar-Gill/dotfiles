return {
	{ "lewpoly/sherbet.nvim", lazy = true },
	{ "olivercederborg/poimandres.nvim", lazy = true },
	{ "mhartington/oceanic-next", lazy = true },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			dark_variant = "moon",
			groups = {
				git_change = "gold",
				git_add = "pine",
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{ "folke/tokyonight.nvim", lazy = true },
	{ "projekt0n/github-nvim-theme", lazy = true },
}
