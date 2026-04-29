-- // Using Alpha for dashboard // --

return {
    "goolord/alpha-nvim",
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        -- // ASCII art header
        dashboard.section.header.val = {
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⠻⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⢿⡏⠈⢿⣿⣿⣿⡿⡄⠈⠻⣿⣿⣿⣿⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⢠⣿⠟⢿⣠⢷⣦⣄⠻⣿⣿⡇⢥⣴⡤⣼⣿⣿⣿⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⢀⡾⣿⣦⢿⠈⠈⠛⠁⠀⠈⠛⠧⠈⠛⠁⢸⣿⣿⣿⡀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⢀⡞⠀⢹⣿⣷⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡏⠑⠄⠀⠀⠀",
            "⠀⠀⠀⠀⠸⠀⠀⣸⣿⣿⣿⣆⠀⠀⠀⠀~⠀⠀⢀⣼⣿⣿⣿⠇⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣷⠢⣀⠀⠀⡠⠐⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠐⠲⠿⢻⣿⣿⣿⣿⣿⡟⠀⠀⠁⠁⠀⠀⢿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠈⣻⣿⡿⢿⣿⣦⡀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⢡⡿⠀⠀⠀⠈⠙⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀ ⠀⠀⠀Mhiatic  Meovim⠀⠀⠀⠀⠀⠀⠀",
        }

        -- // dashboard buttons
        dashboard.section.buttons.val = {
            dashboard.button("f", " Find file", "<cmd>FzfLua files<CR>"),
            dashboard.button("n", " New file", ":ene <BAR> startinsert <CR>"),
            -- Project requires you to have a ~/Projects directory
            dashboard.button("p", " Projects", function()
                local projects_dir = vim.fn.expand("~/Projects")
                local dirs = vim.fn.globpath(projects_dir, "*", false, true)
                -- filter to directories only
                dirs = vim.tbl_filter(function(d)
                    return vim.fn.isdirectory(d) == 1
                end, dirs)
                -- strip full path to show only folder names
                local names = vim.tbl_map(function(d)
                    return vim.fn.fnamemodify(d, ":t")
                end, dirs)
                require("fzf-lua").fzf_exec(names, {
                    prompt = "Projects❯ ",
                    actions = {
                        ["default"] = function(selected)
                            if selected[1] then
                                local project = projects_dir .. "/" .. selected[1]
                                vim.cmd("cd " .. project)
                                require("fzf-lua").files({ cwd = project })
                            end
                        end,
                    },
                })
            end),
            dashboard.button("r", " Recent", "<cmd>FzfLua oldfiles<CR>"),
            dashboard.button("q", " Quit", ":qa<CR>"),
        }

        -- // hide ui elements when dashboard is open
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            nested = true,
            callback = function()
                vim.o.showtabline = 0
                vim.o.laststatus = 0
                pcall(function()
                    require("bufferline.state").set_offset(0)
                end)
                vim.schedule(function()
                    vim.opt_local.number = false
                    vim.opt_local.relativenumber = false
                    vim.opt_local.signcolumn = "no"
                    vim.opt_local.foldenable = false
                    vim.opt_local.statuscolumn = ""
                    vim.o.showtabline = 0
                    vim.o.laststatus = 0
                end)
            end,
        })

        -- // hide cursor when dashboard is open
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            desc = "Hide cursor in alpha dashboard",
            callback = function()
                local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
                hl.blend = 100
                vim.api.nvim_set_hl(0, "Cursor", hl)
                vim.opt.guicursor:append("a:Cursor/lCursor")
            end,
        })

        -- // restore everything when leaving the dashboard
        vim.api.nvim_create_autocmd("BufUnload", {
            pattern = "<buffer>",
            callback = function()
                vim.o.showtabline = 2                         -- restore tabline
                vim.o.laststatus = 2                          -- restore statusline
                vim.o.statuscolumn = "%#LineNr#  %{v:lnum}  " -- restore statuscolumn
                local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
                hl.blend = 0
                vim.api.nvim_set_hl(0, "Cursor", hl)
                vim.opt.guicursor:remove("a:Cursor/lCursor") -- restore cursor
            end,
        })

        dashboard.section.footer.val = "Punpun was just fine again today :)"
        require("alpha").setup(dashboard.opts)
    end,
}
