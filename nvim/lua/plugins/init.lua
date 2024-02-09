return {
	"nvim-lua/plenary.nvim", -- Common utilities

	-- status line
	"nvim-lualine/lualine.nvim",

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- auto close tags and brackets / parentheses
	{ "windwp/nvim-autopairs", event = "InsertEnter" },

	-- auto conversion of f strings (js/ts and python)
	"chrisgrieser/nvim-puppeteer",

	"lukas-reineke/indent-blankline.nvim", -- draw vertical indent lines

	{ "akinsho/bufferline.nvim", version = "*", enabled = false },

	"NvChad/nvim-colorizer.lua",

	-- git
	"lewis6991/gitsigns.nvim",

	-- comments
	"numToStr/Comment.nvim",

	{ "akinsho/toggleterm.nvim", version = "*" },

	-- copilot
	"github/copilot.vim",

	"folke/zen-mode.nvim",

	-- markdown preview
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			-- refer to `configuration to change defaults`
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
}
