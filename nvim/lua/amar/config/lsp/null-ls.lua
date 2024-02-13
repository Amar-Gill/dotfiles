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
		formatting.eslint_d,
		formatting.stylua,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.beautysh.with({ extra_args = { "--indent-size", "2" } }),
		formatting.gofumpt,
		formatting.standardrb,
		formatting.jq,
		diagnostics.eslint_d,
		diagnostics.flake8,
		diagnostics.golangci_lint,
		diagnostics.standardrb,
		-- not installed with mason
		formatting.npm_groovy_lint,
		formatting.mix,
		diagnostics.tidy,
		diagnostics.credo,
	},
})
