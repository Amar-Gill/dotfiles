require("ts_context_commentstring").setup({
	enable_autocmd = false,
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"tsx",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"typescript",
		"go",
		"gomod",
		"markdown",
		"markdown_inline",
		"python",
		"svelte",
		"vue",
		"dockerfile",
		"make",
		"rust",
		"bash",
		"sql",
		"java",
		"astro",
		"ruby",
		"elixir",
		"hcl",
	},
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
