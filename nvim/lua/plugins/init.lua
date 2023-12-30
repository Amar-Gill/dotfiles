return {
	"nvim-lua/plenary.nvim", -- Common utilities

	-- status line
	"nvim-lualine/lualine.nvim",

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- LSP config
	"neovim/nvim-lspconfig", -- enable lsp
	"onsails/lspkind-nvim", -- vscode-like pictograms
	"nvimtools/none-ls.nvim",
	"ray-x/lsp_signature.nvim", -- show lsp signature in insert mode when calling a function
	"folke/neodev.nvim", -- annotations for vim and plugins (requires sumneko_lua ls)
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim", -- external dependencies manager
	{ "j-hui/fidget.nvim" }, -- LSP status updates

	-- auto close tags and brackets / parentheses
	{ "windwp/nvim-autopairs", event = "InsertEnter" },

	-- auto conversion of f strings (js/ts and python)
	"chrisgrieser/nvim-puppeteer",

	-- fuzzy finder
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", enabled = vim.fn.executable("make") == 1 },

	"lukas-reineke/indent-blankline.nvim", -- draw vertical indent lines

	{ "akinsho/bufferline.nvim", version = "*" },

	"NvChad/nvim-colorizer.lua",

	-- git
	"lewis6991/gitsigns.nvim",

	-- comments
	"numToStr/Comment.nvim",

	{ "akinsho/toggleterm.nvim", version = "*" },

	-- breadcrumbs
	"SmiteshP/nvim-navic",

	-- copilot
	"github/copilot.vim",

	"folke/zen-mode.nvim",
}
