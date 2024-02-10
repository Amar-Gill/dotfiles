return {
	"nvim-lualine/lualine.nvim",

	"nvim-tree/nvim-web-devicons",

	"lukas-reineke/indent-blankline.nvim",

	{
		"akinsho/bufferline.nvim",
		version = "*",
		enabled = false,
		opts = {
			options = {
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
				always_show_bufferline = false,
			},
		},
	},

	{ "NvChad/nvim-colorizer.lua", opts = {
		user_default_options = { tailwind = true, mode = "virtualtext" },
	} },

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
