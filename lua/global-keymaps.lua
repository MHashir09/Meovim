-- // ####  GLOBAL KEYMAPS  ##### // --
-- // ########################### // --
-- // ########################### // --

local keymap = vim.keymap.set
local s = { silent = true } -- suppresses commands from being echoed in the command line, which is visually noisy

vim.g.mapleader = " " -- sets leader key to "space bar"

keymap("n", "<space>", "<Nop>", s) -- if space is pressed in normal mode, do nothing. Prevents flickers
keymap("i", "jk", "<Esc>", s) -- because I like to use "jk" to enter normal mode rather than esc
keymap("n", "sa", "ggVG", s) -- selects all text in the buffer. gg(jumps to the first line), V(enters visual mode), G(jumps to last line)
keymap("n", "<C-d>", "<C-d>zz",s) -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz", s) -- Scroll up and center the cursor
keymap("n", "<C-h>", "<C-w>h", s) -- move to left split
keymap("n", "<C-l>", "<C-w>l", s) -- move to right split
keymap("n", "<C-j>", "<C-w>j", s) -- move to split below
keymap("n", "<C-k>", "<C-w>k", s) -- move to split above
keymap("v", "<Leader>p", '"_dP', s) -- paste over selected text without losing the afore-copied text
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s) -- split the window vertically
keymap("n", "<Leader>-", "<cmd>split<CR>", s) -- split the window horizontally
keymap("n", "<leader>up", '<cmd>lua vim.pack.update()<CR>') -- updates vim.pack packages


keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- j navigates visual rows normally, but uses real lines when given a count (e.g. 5j)
keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true }) -- k navigates visual rows normally, but uses real lines when given a count (e.g. 8k)
keymap("n", "<Leader>f", function()
    vim.lsp.buf.format({ async = true })
end, s) -- formats the current buffer using LSP, async = true so formatting doesn't block the editor on large files
keymap("n", "<leader>b", function()
    vim.ui.open(vim.fn.expand("%:p"))
end, { silent = true, desc = "Open file in browser" })

local functions = require("functions-autocmds")
keymap("n", "<Leader>t", functions.toggle_terminal, s) -- toggle terminal
keymap("t", "jk", "<C-\\><C-N>", s)           -- exit terminal mode
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", s)  -- move to left split
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", s)  -- move to split below
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", s)  -- move to split above
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", s)  -- move to right split
keymap("t", "<Leader>_", "<cmd>vsplit | terminal<CR>", s) -- Open new terminal in vertical split


