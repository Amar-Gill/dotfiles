return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		lazy = true,
		priority = 1000,
		opts = {
			-- dark_variant = "moon",
			groups = {
				git_change = 'gold',
				git_add = 'pine',
			},
		},
		config = function(_, opts)
			require('rose-pine').setup(opts)
			vim.cmd [[colorscheme rose-pine]]
		end,
	},
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		opts = { style = 'night' },
		config = function(_, opts)
			require('tokyonight').setup(opts)
			vim.cmd [[colorscheme tokyonight]]
		end,
	},
	{ 'projekt0n/github-nvim-theme', lazy = true },
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = true,
		opts = { flavour = 'auto', background = { light = 'latte', dark = 'mocha' } },
	},
	{
		'vague2k/vague.nvim',
		lazy = true,
	},
	{
		'thesimonho/kanagawa-paper.nvim',
		lazy = true,
		opts = { cache = true },
	},
}
