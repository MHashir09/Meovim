-- // We will use mason to manage our lsps // --

return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
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
                "emmet_ls",
                "pyright",
                "ts_ls",
                "rust_analyzer",
                "eslint",       -- linter for js/ts/html/css
                "ruff",         -- linter for python
            },
            automatic_installation = true,
        })

        vim.lsp.enable({
            "bashls",
            "clangd",
            "html",
            "cssls",
            "lua_ls",
            "emmet_ls",
            "pyright",
            "ts_ls",
            "rust_analyzer",
            "eslint",
            "ruff",
        })

        vim.diagnostic.config({ virtual_text = true }) -- controls how lsp diagnostics are displayed
    end,
}
