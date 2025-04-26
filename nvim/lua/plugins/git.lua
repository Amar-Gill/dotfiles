return {
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '▎' },
				change = { text = '▎' },
				delete = { text = '' },
				topdelete = { text = '' },
				changedelete = { text = '▎' },
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
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = 'rounded',
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local nnoremap = require('amar.keymap').nnoremap

				-- Navigation
				nnoremap(']g', function()
					if vim.wo.diff then
						return ']c'
					end
					vim.schedule(function()
						gs.next_hunk { preview = true }
						vim.cmd.normal 'zz'
					end)
					return '<Ignore>'
				end, { expr = true })

				nnoremap('[g', function()
					if vim.wo.diff then
						return '[c'
					end
					vim.schedule(function()
						gs.prev_hunk { preview = true }
						vim.cmd.normal 'zz'
					end)
					return '<Ignore>'
				end, { expr = true })

				nnoremap('<leader>gsrh', function()
					vim.schedule(function()
						gs.reset_hunk()
					end)
				end)

				nnoremap('<leader>gsrb', function()
					vim.schedule(function()
						gs.reset_buffer()
					end)
				end)

				nnoremap('gp', function()
					gs.preview_hunk()
				end)

				nnoremap('glb', function()
					gs.blame_line()
				end)
			end,
		},
	},
}
