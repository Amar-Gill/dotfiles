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
					javascript = { { "prettierd", "prettier" }, "eslint_d" },
					typescript = { { "prettierd", "prettier" }, "eslint_d" },
					astro = { { "prettierd", "prettier" }, "eslint_d" },
					svelte = { { "prettierd", "prettier" }, "eslint_d" },
					vue = { { "prettierd", "prettier" }, "eslint_d" },
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
