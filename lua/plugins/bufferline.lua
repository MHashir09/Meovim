-- // Using bufferline for visual buffer tabs // --

return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "UIEnter",
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
			vim.keymap.set(
				"n",
				"<A-" .. i .. ">",
				"<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
				{ silent = true, desc = "Go to buffer " .. i }
			)
		end
		vim.keymap.set("n", "<A-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", { silent = true, desc = "Go to last buffer" })

		-- // buffer management
		vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { silent = true, desc = "Pin buffer" })
		vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { silent = true, desc = "Close buffer" })
		vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { silent = true, desc = "Close buffers to the right" })
		vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { silent = true, desc = "Close buffers to the left" })
	end,
}
