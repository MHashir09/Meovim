-- // We will use mason to manage our lsps // --
vim.pack.add({
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/neovim/nvim-lspconfig',
})

require("mason").setup()

-- // I am enabling and installing the lsps I use // --
-- // You can add or remove the ones you want or dont want respectively, in similar fashion // --
-- // You can manage them through ":Mason" // --

require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "html",
        "cssls",
        "lua_ls",
        "pyright",
        "ts_ls",
        "rust_analyzer",
    },
    automatic_installation = true,
})

vim.lsp.enable({
    "bashls",
    "clangd",
    "html",
    "cssls",
    "lua_ls",
    "pyright",
    "ts_ls",
    "rust_analyzer",
})

vim.diagnostic.config({ virtual_text = true }) -- controls how lsp diagnostics are displayed
