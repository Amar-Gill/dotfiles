return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			-- your personnal icons can go here (to override)
			-- DevIcon will be appended to `name`
			override = {},
			-- globally enable default icons (default to false)
			-- will get overriden by `get_icons` option
			default = true,
		},
	},

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {
		indent = { char = "┊" },
	} },

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

	{ "folke/zen-mode.nvim" },

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
