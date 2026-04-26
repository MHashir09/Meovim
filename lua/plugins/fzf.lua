-- // fzf-lua for fuzzy finding // --

return {
	"ibhagwan/fzf-lua",
	config = function()
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			winopts = { backdrop = 85 }, -- slight background dim
			keymap = {
				builtin = {
					["<C-f>"] = "preview-page-down", -- scroll preview down
					["<C-b>"] = "preview-page-up", -- scroll preview up
					["<C-p>"] = "toggle-preview", -- toggle preview window
				},
				fzf = {
					["ctrl-a"] = "toggle-all", -- select all results
					["ctrl-t"] = "first", -- jump to first result
					["ctrl-g"] = "last", -- jump to last result
					["ctrl-d"] = "half-page-down", -- scroll down half page
					["ctrl-u"] = "half-page-up", -- scroll up half page
				},
			},
			actions = {
				files = {
					["ctrl-q"] = actions.file_sel_to_qf, -- send selection to quickfix
					["ctrl-n"] = actions.toggle_ignore, -- toggle .gitignore
					["ctrl-h"] = actions.toggle_hidden, -- toggle hidden files
					["enter"] = actions.file_edit_or_qf, -- open file or quickfix
				},
			},
		})

		local keymap = vim.keymap.set
		keymap("n", "<C-f>", "<cmd>FzfLua files<cr>", { silent = true, desc = "Find files" })
		keymap("n", "<C-g>", "<cmd>FzfLua live_grep<cr>", { silent = true, desc = "Live grep" })
		keymap("n", "<leader>k", "<cmd>FzfLua keymaps<CR>", { silent = true, desc = "Find keymaps" })
		keymap("n", "<leader>h", "<cmd>FzfLua helptags<cr>", { silent = true, desc = "Find help" })
		keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { silent = true, desc = "Find buffers" })
	end,
}
