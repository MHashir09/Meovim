-- // This installs and sets up the desired color scheme // --
-- // If you want, you can add your desired color schemes in similar fashion // --
-- // As an example, I have commented out catppuccin, you can uncomment and comment out koda // --

vim.pack.add({
    { src = "https://github.com/oskarnurm/koda.nvim" },
--    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("koda").setup({ transparent = true })
vim.cmd("colorscheme koda-dark")

-- require("catppuccin").setup({ transparent_background = true })
-- vim.cmd("colorscheme catppuccin-mocha") -- mocha, macchiato, frappe, latte
