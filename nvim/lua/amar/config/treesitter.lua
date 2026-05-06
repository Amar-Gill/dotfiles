require('ts_context_commentstring').setup {
	enable_autocmd = false,
}

require('nvim-ts-autotag').setup()

require('nvim-treesitter').install {
	'tsx',
	'json',
	'yaml',
	'css',
	'html',
	'lua',
	'typescript',
	'go',
	'gomod',
	'markdown',
	'markdown_inline',
	'python',
	'svelte',
	'vue',
	'dockerfile',
	'make',
	'rust',
	'bash',
	'sql',
	'java',
	'astro',
	'ruby',
	'elixir',
	'hcl',
	'zig',
}
