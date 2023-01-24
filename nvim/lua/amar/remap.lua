local Remap = require("amar.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap

nnoremap("<leader>d", "<cmd>bd<CR>") -- delete current buffer

nnoremap("<leader>v", "<cmd>vsplit<CR>") -- new vertical window
nnoremap("<leader>w", "<C-w>c") -- close active window

nnoremap("<leader>bg", ':exec &bg=="light" ? "set bg=dark" : "set bg=light" <CR>') -- toggle light / dark bg

-- navigate between windows
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- stay in visual mode when indenting blocks of text
vnoremap(">", ">gv")
vnoremap("<", "<gv")

nnoremap(">", ">>")
nnoremap("<", "<<")

-- move text up and down (MacOS)
nnoremap("∆", ":m .+1<CR>") -- <M-j>
nnoremap("˚", ":m .-2<CR>") -- <M-k>
vnoremap("∆", ":m .+1<CR>gv") -- <M-j>
vnoremap("˚", ":m .-2<CR>gv") -- <M-k>

nnoremap("<M-j>", ":m .+1<CR>") -- <M-j>
nnoremap("<M-k>", ":m .-2<CR>") -- <M-k>
vnoremap("<M-j>", ":m .+1<CR>gv") -- <M-j>
vnoremap("<M-k>", ":m .-2<CR>gv") -- <M-k>

-- clipboard remaps
-- keep pasted value in clipboard when pasting over other text
vnoremap("p", '"_dP')
xnoremap("p", '"_dP')

nnoremap("<leader>h", "<cmd>set hlsearch!<CR>") -- toggle highlight search
