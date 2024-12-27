local nnoremap = require("amar.keymap").nnoremap

local M = {}

local lsp_handler_config = {
	border = "rounded",
	style = "minimal",
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp_handler_config)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp_handler_config)

local display_lsp_signature = function(bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		floating_window = false,
		toggle_key = "<C-s>",
		hint_prefix = "🌗 ",
	}, bufnr)
end

local lsp_keymaps = function(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	nnoremap("gD", vim.lsp.buf.declaration, bufopts)
	nnoremap("gd", vim.lsp.buf.definition, bufopts)
	nnoremap("K", vim.lsp.buf.hover, bufopts)
	nnoremap("gi", vim.lsp.buf.implementation, bufopts)
	nnoremap("gs", vim.lsp.buf.signature_help, bufopts)
	nnoremap("<leader>D", vim.lsp.buf.type_definition, bufopts)
	nnoremap("<leader>rn", vim.lsp.buf.rename, bufopts)
	nnoremap("<leader>ca", vim.lsp.buf.code_action, bufopts)
	nnoremap("gr", vim.lsp.buf.references, bufopts)

	local diagnostic_move_opts = { border = "rounded", float = false }

	nnoremap("gld", function()
		vim.diagnostic.open_float({ border = "rounded" })
	end, bufopts)
	nnoremap("]d", function()
		vim.schedule(function()
			vim.diagnostic.goto_next(diagnostic_move_opts)
			vim.cmd.normal("zz")
		end)
	end, bufopts)
	nnoremap("[d", function()
		vim.schedule(function()
			vim.diagnostic.goto_prev(diagnostic_move_opts)
			vim.cmd.normal("zz")
		end)
	end, bufopts)
	nnoremap("<leader>q", function()
		vim.diagnostic.setloclist()
	end, bufopts)
end

-- allows for context aware breadcrumbs
local breadcrumbs = function(client, bufnr)
	-- https://github.com/SmiteshP/nvim-navic/issues/89
	if client.name == "volar" then
		return
	end

	local navic = require("nvim-navic")

	if client.server_capabilities.documentSymbolProvider then
		navic.setup({
			highlight = true,
			icons = {
				File = " ",
				Module = " ",
				Namespace = " ",
				Package = " ",
				Class = " ",
				Method = " ",
				Property = " ",
				Field = " ",
				Constructor = " ",
				Enum = " ",
				Interface = " ",
				Function = " ",
				Variable = " ",
				Constant = " ",
				String = " ",
				Number = " ",
				Boolean = " ",
				Array = " ",
				Object = " ",
				Key = " ",
				Null = " ",
				EnumMember = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
		})
		navic.attach(client, bufnr)
	end
end

local highlight_augroup = vim.api.nvim_create_augroup("HighlightReferencesOnCursor", {})

local lsp_highlights = function(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd("CursorHold", {
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
			buffer = bufnr,
		})
	end
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlights(client, bufnr)
	display_lsp_signature(bufnr)
	breadcrumbs(client, bufnr)
end

local protocol = require("vim.lsp.protocol")

M.capabilities = require("cmp_nvim_lsp").default_capabilities(protocol.make_client_capabilities())

return M
