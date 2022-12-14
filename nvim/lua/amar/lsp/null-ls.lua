local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettierd,
		formatting.stylua,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.npm_groovy_lint, -- not installed with mason
		formatting.beautysh.with({ extra_args = { "--indent-size", "2" } }),
		formatting.gofumpt,
		diagnostics.eslint_d,
		diagnostics.tidy, -- not installed with mason
		diagnostics.flake8,
		diagnostics.golangci_lint,
	},
})
