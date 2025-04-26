return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim', -- Common utilities
			'nvim-telescope/telescope-file-browser.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', enabled = vim.fn.executable 'make' == 1 },
		},
		config = function()
			require 'amar.config.telescope'
		end,
	},
}
