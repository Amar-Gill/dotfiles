return {
	"nvim-lualine/lualine.nvim",

	"nvim-tree/nvim-web-devicons",

	"lukas-reineke/indent-blankline.nvim",

	{ "akinsho/bufferline.nvim", version = "*", enabled = false },

	"NvChad/nvim-colorizer.lua",

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

	{ "akinsho/toggleterm.nvim", version = "*" },
}
