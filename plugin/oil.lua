-- // We will use oil.nvim plugin for file navigation // --

vim.pack.add({
    -- dependencies --
    'https://github.com/nvim-tree/nvim-web-devicons',
    -- actual plugin --
    'https://github.com/stevearc/oil.nvim',
})

require("oil").setup({
    -- oil specific keymaps --
    keymaps = {
        ["<CR>"] = "actions.select",           -- open file/directory
        ["-"]    = "actions.parent",           -- go up a directory
        ["_"]    = "actions.open_cwd",         -- go to current working directory (the one from which neovim was launched from)
        ["g."]   = "actions.toggle_hidden",    -- toggle hidden files
        ["gp"]   = "actions.preview",          -- preview file
        ["q"]    = "actions.close",            -- close oil
    }
})

-- // Keymap to toggle oil

vim.keymap.set("n", "f", function()
    local oil = require("oil")
	    if oil.get_current_dir() then
			oil.close()
		else
			oil.open()
		end
end, { desc = "Toggle Oil file explorer", silent = true })
