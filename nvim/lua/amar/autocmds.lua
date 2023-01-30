vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "Avoid overwritten by loading color schemes later",
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", {
			link = "Normal",
		})
		vim.api.nvim_set_hl(0, "FloatBorder", {
			link = "Normal",
		})
	end,
})
