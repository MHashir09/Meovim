-- // We will use mini.nvim which is a collection of various QOL plugins // --

vim.pack.add({ 'https://github.com/echasnovski/mini.nvim' })

require("mini.icons").setup() -- for statusline icons
require("mini.statusline").setup({
    content = {
        active = function()
            -- defines the statusline layout: mode | filename ... diagnostics | fileinfo | line:col
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local filename = vim.fn.expand("%:p:~:.")
            local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filetype      = vim.bo.filetype
            local icon          = MiniIcons.get("filetype", filetype)
            return MiniStatusline.combine_groups({
                { hl = mode_hl,                     strings = { mode } },
                { hl = "MiniStatuslineFilename",    strings = { filename } },
                "%<", "%=",
                { hl = "MiniStatuslineDiagnostics", strings = { diagnostics } },
                { hl = "MiniStatuslineFileinfo",    strings = { icon .. " " .. filetype } },
                { hl = mode_hl,                     strings = { "%l | %c" } },
            })
        end,
    },
}) -- Enables and configures mini statusline

require("mini.pairs").setup()    -- auto close brackets and quotes
require("mini.comment").setup()  -- gcc to comment line, gc in visual mode (same to uncomment)
require("mini.move").setup() -- move lines or selections around with Alt+hjkl
require("mini.animate").setup() -- smooth scrolling and cursor animations
require("mini.indentscope").setup() -- shows a line indicating current indent scope
require("mini.ai").setup() -- daf/caf(function) dac/cac(class) da,/ca,(argument) dat/cat(tag) -- i = inner, a = around
