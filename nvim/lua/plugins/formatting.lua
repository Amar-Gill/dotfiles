return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { { "prettierd", "prettier" }, "eslint_d" },
					typescript = { { "prettierd", "prettier" }, "eslint_d" },
					go = { "gofumpt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			require("amar.keymap").nnoremap("<leader>f", function()
				conform.format({ async = true, lsp_fallback = true })
			end)
		end,
	},
}
