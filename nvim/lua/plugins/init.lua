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
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = {
					hl = "GitSignsChange",
					text = "▎",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = {
					hl = "GitSignsDelete",
					text = "",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				topdelete = {
					hl = "GitSignsDelete",
					text = "",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "▎",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter_opts = {
				relative_time = false,
			},
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			yadm = {
				enable = false,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local nnoremap = require("amar.keymap").nnoremap

				-- Navigation
				nnoremap("]g", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk({ preview = true })
						vim.cmd.normal("zz")
					end)
					return "<Ignore>"
				end, { expr = true })

				nnoremap("[g", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk({ preview = true })
						vim.cmd.normal("zz")
					end)
					return "<Ignore>"
				end, { expr = true })

				nnoremap("gp", function()
					gs.preview_hunk()
				end)

				nnoremap("glb", function()
					gs.blame_line()
				end)
			end,
		},
	},

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
