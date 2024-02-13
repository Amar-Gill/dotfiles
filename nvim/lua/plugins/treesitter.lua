return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("amar.config.treesitter")
		end,
	},

	-- syntax highlighting special cases
	{ "towolf/vim-helm", event = "VeryLazy" }, -- highlighting for helm charts which are Go templates disguised as .yaml files
	{ "Cian911/vim-cadence", ft = "cadence" }, -- cadence language (flow smart contracts)
}
