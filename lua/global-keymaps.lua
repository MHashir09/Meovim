-- // ########################### // --
-- // ####  GLOBAL KEYMAPS  ##### // --
-- // ########################### // --

local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>", { silent = true, desc = "Disable space in normal mode" })
keymap("i", "jk", "<Esc>", { silent = true, desc = "Exit insert mode" })
keymap("n", "sa", "ggVG", { silent = true, desc = "Select all" })
keymap("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Scroll down and center" })
keymap("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Scroll up and center" })
keymap("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left split" })
keymap("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right split" })
keymap("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to split below" })
keymap("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to split above" })
keymap("v", "<Leader>p", '"_dP', { silent = true, desc = "Paste without overwriting register" })
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", { silent = true, desc = "Vertical split" })
keymap("n", "<Leader>-", "<cmd>split<CR>", { silent = true, desc = "Horizontal split" })

keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true, desc = "Move down (visual lines)" })

keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true, desc = "Move up (visual lines)" })

keymap("n", "<Leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { silent = true, desc = "Format buffer" })

keymap("n", "<leader>b", function()
    vim.ui.open(vim.fn.expand("%:p"))
end, { silent = true, desc = "Open file in browser" })

keymap("t", "<space>", "<space>", { silent = true, desc = "Space in terminal mode" })

local functions = require("functions-autocmds")
keymap("n", "<Leader>t", functions.toggle_terminal, { silent = true, desc = "Toggle terminal" })
keymap("t", "jk", "<C-\\><C-N>", { silent = true, desc = "Exit terminal mode" })
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true, desc = "Terminal: move to left split" })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true, desc = "Terminal: move to split below" })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true, desc = "Terminal: move to split above" })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true, desc = "Terminal: move to right split" })
keymap("t", "<Leader>_", "<cmd>vsplit | terminal<CR>", { silent = true, desc = "New terminal in vertical split" })
