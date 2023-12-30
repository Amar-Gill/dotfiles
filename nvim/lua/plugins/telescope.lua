return {
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", enabled = vim.fn.executable("make") == 1 },
}
