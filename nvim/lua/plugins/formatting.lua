return {
	{
		"stevearc/conform.nvim",
		event = { "VeryLazy" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { formatters = { "prettierd", "prettier", "eslint_d" }, stop_after_first = false },
					typescript = { formatters = { "prettierd", "prettier", "eslint_d" }, stop_after_first = false },
					astro = { formatters = { "prettierd", "prettier", "eslint_d" }, stop_after_first = false },
					svelte = { formatters = { "prettierd", "prettier", "eslint_d" }, stop_after_first = false },
					vue = { formatters = { "prettierd", "prettier", "eslint_d" }, stop_after_first = false },
					go = { "gofumpt" },
					zsh = { "beautysh" },
					bash = { "beautysh" },
					sh = { "beautysh" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters = {
					beautysh = {
						prepend_args = { "--indent-size", "2" },
					},
				},
			})

			require("amar.keymap").nnoremap("<leader>f", function()
				conform.format({ async = true, lsp_format = "fallback" })
			end)
		end,
	},
}
