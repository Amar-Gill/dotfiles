local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	border = "rounded",
	sources = {
		formatting.prettierd.with({ extra_filetypes = { "astro", "svelte" } }),
		formatting.stylua,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.gofumpt,
		diagnostics.golangci_lint,
		-- not installed with mason
		formatting.npm_groovy_lint,
		formatting.mix,
		diagnostics.tidy,
		diagnostics.credo,
	},
})
