vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "Avoid overwritten by loading color schemes later",
	group = vim.api.nvim_create_augroup("colorscheme-float-window-hl-normalize", { clear = true }),
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", {
			link = "Normal",
		})
		vim.api.nvim_set_hl(0, "FloatBorder", {
			link = "Normal",
		})
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
