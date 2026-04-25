-- // We will use blink.cmp for robust completions // --

return {
    "saghen/blink.cmp",
    version = "v1.*",   -- locked to major v1 to avoid breaking changes
    event = "InsertEnter", -- load when entering insert mode
    config = function()
        require('blink.cmp').setup({
            fuzzy = { implementation = 'prefer_rust_with_warning' }, -- faster rust fuzzy matcher, needs cargo
            signature = { enabled = true }, -- shows function signature as you type arguments
            keymap = {
                preset = "default",
                ["<C-space>"] = {}, -- disabled: manually trigger completion
                ["<C-p>"] = {},     -- disabled: default prev item
                ["<Tab>"] = {},     -- disabled: default accept
                ["<S-Tab>"] = {},   -- disabled: default prev item
                ["<C-y>"] = { "show", "show_documentation", "hide_documentation" }, -- toggle completion/docs
                ["<C-n>"] = { "select_and_accept" },          -- accept selected item
                ["<C-k>"] = { "select_prev", "fallback" },    -- previous item
                ["<C-j>"] = { "select_next", "fallback" },    -- next item
                ["<C-b>"] = { "scroll_documentation_down", "fallback" }, -- scroll docs down
                ["<C-f>"] = { "scroll_documentation_up", "fallback" },   -- scroll docs up
                ["<C-l>"] = { "snippet_forward", "fallback" },  -- next snippet placeholder
                ["<C-h>"] = { "snippet_backward", "fallback" }, -- prev snippet placeholder
            },
            appearance = {
                use_nvim_cmp_as_default = true, -- use nvim-cmp highlight groups for theming
                nerd_font_variant = "normal",   -- icon style: "normal" or "mono"
            },
            completion = {
                documentation = {
                    auto_show = true,           -- automatically show docs popup
                    auto_show_delay_ms = 200,   -- delay before showing docs
                }
            },
            cmdline = {
                keymap = {
                    preset = 'inherit', -- reuse same keymaps in command line mode
                    ['<CR>'] = { 'accept_and_enter', 'fallback' }, -- confirm and execute command
                },
            },
            sources = { default = { "lsp", "path", "buffer", "snippets" } } -- completion sources
        })
    end,
}
