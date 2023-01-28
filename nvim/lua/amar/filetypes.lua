local mdx_ft_detect = vim.api.nvim_create_augroup("mdx_ft_detect", {})
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter" }, {
	group = mdx_ft_detect,
	callback = function()
		local filename = vim.api.nvim_buf_get_name(0)
		local match = string.find(filename, ".mdx")
		if match then
			vim.cmd("set filetype=markdown.mdx")
		end
	end,
})
