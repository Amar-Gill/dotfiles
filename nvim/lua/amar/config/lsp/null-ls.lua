local null_ls = require('null-ls')

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	border = 'rounded',
	sources = {
		diagnostics.golangci_lint,
		-- not installed with mason
		diagnostics.tidy,
		diagnostics.credo,
	},
})
