local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local nnoremap = require("amar.keymap").nnoremap

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = telescope.extensions.file_browser.actions

local fb_layout_config = {
	height = vim.api.nvim_get_option("lines") - 8,
	width = vim.api.nvim_get_option("columns") - 8,
}

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
				["<C-c>"] = actions.close,
				["/"] = function()
					vim.cmd.startinsert()
				end,
				["<C-j>"] = actions.preview_scrolling_down,
				["<C-k>"] = actions.preview_scrolling_up,
			},
		},
	},
	extensions = {
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			layout_config = fb_layout_config,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["D"] = fb_actions.remove,
					["R"] = fb_actions.rename,
					["h"] = fb_actions.goto_parent_dir,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")

nnoremap("\\f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)

nnoremap("\\r", function()
	builtin.live_grep()
end)

nnoremap("\\\\", function()
	builtin.buffers()
end)

nnoremap("\\t", function()
	builtin.help_tags()
end)

nnoremap("|", function()
	builtin.resume()
end)

nnoremap("\\d", function()
	builtin.diagnostics({
		initial_mode = "normal",
	})
end)

nnoremap("\\ls", function()
	builtin.lsp_document_symbols()
end)

nnoremap("\\s", function()
	builtin.git_status({
		initial_mode = "normal",
	})
end)

nnoremap("\\c", function()
	builtin.git_commits({
		initial_mode = "normal",
	})
end)

nnoremap("\\C", function()
	builtin.git_bcommits({
		initial_mode = "normal",
	})
end)

nnoremap("gr", function()
	builtin.lsp_references({
		initial_mode = "normal",
	})
end)

nnoremap("\\b", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		initial_mode = "normal",
		layout_config = fb_layout_config,
	})
end)

nnoremap("<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })
