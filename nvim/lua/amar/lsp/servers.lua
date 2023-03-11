local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

require("lspconfig.ui.windows").default_options.border = "rounded"

local groovyls_dir = os.getenv("HOME") .. "/groovy-language-server/build/libs/groovy-language-server-all.jar"
local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					-- get the language server to recognize the "vim" global
					globals = { "vim" },
				},
				workspace = {
					-- make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				completion = {
					callSnippet = "Replace",
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	html = {},
	tsserver = {},
	pyright = {},
	bashls = {
		filetypes = { "sh", "zsh", "bash" },
	},
	tailwindcss = {},
	gopls = {},
	groovyls = {
		cmd = { "java", "-jar", groovyls_dir },
	},
	astro = {},
	svelte = {},
	solargraph = {},
	volar = {},
	elixirls = {},
}

require("mason").setup({
	ui = { border = "rounded" },
})
require("mason-lspconfig").setup({
	automatic_installation = { exclude = { "groovyls" } },
})

local on_attach = require("amar.lsp.handlers").on_attach
local capabilities = require("amar.lsp.handlers").capabilities

for server, server_opts in pairs(servers) do
	local base_opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- "keep" means server_opts is prioritized over base_opts if there is key name collision
	local opts = vim.tbl_deep_extend("keep", server_opts, base_opts)

	nvim_lsp[server].setup(opts)
end

-- special cases
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cadence",
	callback = function()
		local flow_project_dir = vim.fs.dirname(vim.fs.find({ "flow.json" }, { upward = true })[1])
		vim.lsp.start({
			name = "cadence-language-server",
			cmd = { "flow", "cadence", "language-server" },
			root_dir = flow_project_dir,
			init_options = {
				configPath = flow_project_dir .. "/flow.json",
				numberOfAccounts = "3",
			},
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
})
