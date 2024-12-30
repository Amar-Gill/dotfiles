local Remap = require("amar.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap

local function edit_ghostty_config()
	vim.cmd([[ e ~/dotfiles/ghostty/config ]])
end

nnoremap("<leader>gho", edit_ghostty_config)

local function delete_all_bufs_skip_current()
	local current_bufnr = vim.api.nvim_get_current_buf()
	local bufnrs = vim.api.nvim_list_bufs()
	for _, bufnr in pairs(bufnrs) do
		if bufnr ~= current_bufnr then
			pcall(vim.api.nvim_buf_delete, bufnr, { force = false })
		end
	end
	vim.schedule(function()
		vim.cmd("mode")
	end)
end

nnoremap("<leader>bd", "<cmd>bd<CR>") -- delete current buffer
nnoremap("<leader>bad", delete_all_bufs_skip_current) -- delete all buffers except current
nnoremap("<C-j>", ":bnext <CR>")
nnoremap("<C-k>", ":bprev <CR>")
nnoremap("<leader>zm", ":ZenMode<CR>")

nnoremap("<leader>w", "<C-w>") -- remap for window commands

nnoremap("<leader>bg", ':exec &bg=="light" ? "set bg=dark" : "set bg=light" <CR>') -- toggle light / dark bg

-- stay in visual mode when indenting blocks of text
vnoremap(">", ">gv")
vnoremap("<", "<gv")

nnoremap(">", ">>")
nnoremap("<", "<<")

nnoremap("<M-j>", ":m .+1<CR>")
nnoremap("<M-k>", ":m .-2<CR>")
vnoremap("<M-j>", ":m '>+1<CR><esc>gv")
vnoremap("<M-k>", ":m '<-2<CR><esc>gv")

-- quickfix list
nnoremap("]q", ":cnext<CR>")
nnoremap("[q", ":cprev<CR>")
nnoremap("<leader>cq", ":cclose<CR>")

-- resize window with arrows
nnoremap("<M-Up>", ":resize +2<CR>")
nnoremap("<M-Down>", ":resize -2<CR>")
nnoremap("<M-Left>", ":vertical resize -2<CR>")
nnoremap("<M-Right>", ":vertical resize +2<CR>")

-- clipboard remaps
-- keep pasted value in clipboard when pasting over other text
vnoremap("p", '"_dP')
xnoremap("p", '"_dP')

nnoremap("<leader>hl", "<cmd>set hlsearch!<CR>") -- toggle highlight search
