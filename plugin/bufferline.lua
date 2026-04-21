-- // Using bufferline for

vim.pack.add({ 'https://github.com/akinsho/bufferline.nvim' })

require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
        separator_style = "thick",
        tab_size = 26,
        max_name_length = 30,
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
    },
})

-- switch buffers with Alt+number
for i = 1, 9 do
    vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", { silent = true })
end
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", { silent = true }) -- last buffer

-- buffer management
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { silent = true }) -- pins a buffer so it stays in place and doesn't get pushed around when you open/close other buffers
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { silent = true }) -- closes/deletes the current buffer
vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { silent = true }) -- closes/deletes the current buffer to the right of the current one
vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { silent = true }) -- closes/deletes the current buffer to the right of the current one
