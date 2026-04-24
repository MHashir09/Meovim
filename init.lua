-- // ################################################# // --
-- // ####  BOOTSTRAPPING LAZY.NVIM PLUGIN MANAGER #### // --
-- // ################################################# // --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- // Core config // --
require("vim-options")
require("functions-autocmds")
require("global-keymaps")

-- // Plugins // --
require("lazy").setup({
    { import = "plugins" },
}, {
    git = {
        timeout = 300, -- increase timeout to 5 minutes for large repos
    },
})
