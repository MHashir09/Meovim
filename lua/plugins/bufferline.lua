-- // Using bufferline for visual buffer tabs // --

return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "UIEnter", -- load after UI is ready
    config = function()
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

        -- // switch buffers with Alt+number
        for i = 1, 9 do
            vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", { silent = true })
        end
        vim.keymap.set("n", "<A-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", { silent = true }) -- last buffer

        -- // buffer management
        vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { silent = true })        -- pins buffer in place
        vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { silent = true })                    -- close current buffer
        vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { silent = true })       -- close all buffers to the right
        vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { silent = true })        -- close all buffers to the left
    end,
}
