return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",

	-- syntax highlighting special cases
	"towolf/vim-helm", -- highlighting for helm charts which are Go templates disguised as .yaml files
	"Cian911/vim-cadence", -- cadence language (flow smart contracts)
}
