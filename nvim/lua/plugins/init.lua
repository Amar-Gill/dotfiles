return {
	"nvim-lua/plenary.nvim", -- Common utilities

	-- color themes
	"lewpoly/sherbet.nvim",
	"olivercederborg/poimandres.nvim",
	"mhartington/oceanic-next",
	"sainnhe/edge",
	{ "rose-pine/neovim", name = "rose-pine" },

	-- status line
	"nvim-lualine/lualine.nvim",

	-- icons
	"kyazdani42/nvim-web-devicons",

	-- LSP config
	"neovim/nvim-lspconfig", -- enable lsp
	"onsails/lspkind-nvim", -- vscode-like pictograms
	"nvimtools/none-ls.nvim",
	"ray-x/lsp_signature.nvim", -- show lsp signature in insert mode when calling a function
	"folke/neodev.nvim", -- annotations for vim and plugins (requires sumneko_lua ls)
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim", -- external dependencies manager
	{ "j-hui/fidget.nvim" }, -- LSP status updates

	-- completion
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-nvim-lsp", -- lsp completion source
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-cmdline", -- command line completions

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- treesitter (syntax parsing)
	{
		"nvim-treesitter/nvim-treesitter",
		build = "TSUpdate",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- syntax highlighting special cases
	"towolf/vim-helm", -- highlighting for helm charts which are Go templates disguised as .yaml files
	"Cian911/vim-cadence", -- cadence language (flow smart contracts)

	-- auto close tags and brackets / parentheses
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- auto conversion of f strings (js/ts and python)
	"chrisgrieser/nvim-puppeteer",

	-- fuzzy finder
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", enabled = vim.fn.executable("make") == 1 },

	"lukas-reineke/indent-blankline.nvim", -- draw vertical indent lines

	"akinsho/nvim-bufferline.lua",

	"norcalli/nvim-colorizer.lua",

	-- git
	"lewis6991/gitsigns.nvim",

	-- comments
	"numToStr/Comment.nvim",

	{ "akinsho/toggleterm.nvim", tag = "*" },

	-- breadcrumbs
	"SmiteshP/nvim-navic",

	-- copilot
	"github/copilot.vim",

	"folke/zen-mode.nvim",
}
