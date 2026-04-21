-- // ################### // --
-- // ####  OPTIONS  #### // --
-- // ################### // --

local o = vim.opt
o.number = true -- enables line numbers
o.relativenumber = false -- disables relative line numbers
o.clipboard = "unnamedplus" -- this makes every yank/paste automatically use the system clipboard, links ' " ' to ' + ' register
o.signcolumn = "yes:1" -- reserves a fixed column on the left for signs
o.termguicolors = true -- enables 24-bit RGB colors instead of the terminal's 256-color palette
o.cursorline = true -- highlights the entire line your cursor is on
o.winborder = "rounded" -- rounds the corners of floating windows
o.fillchars = { eob = " " } -- removes ~ from empty lines
o.statuscolumn = "%#LineNr#  %{v:lnum}  " -- left padding: 2 spaces | right padding: 2 spaces
o.wrap = true -- long lines wrap to next visual line
o.autoindent = true -- new line starts at the same indent level as the current one
o.expandtab = true --  pressing Tab inserts spaces instead of a \t character
o.tabstop = 4 -- how wide a literal \t character appears visually
o.softtabstop = 4 -- how many spaces are inserted/deleted when you press Tab/Backspace in insert mode
o.shiftwidth = 4 -- how many spaces >>, <<, and autoindent use
o.shiftround = true -- when indenting with >>, rounds to the nearest multiple of shiftwidth
o.ignorecase = true -- makes all searches case-insensitive by default
o.smartcase = true -- if search contains any uppercase letter, it becomes case sensitive
o.hlsearch = false -- doesn't keep matches highlighted after you finish searching
o.inccommand = "nosplit" -- shows a live preview of :s/foo/bar substitutions as you type, without opening a split
o.swapfile = false -- disables swap files because I find them annoying
o.undofile = true --  persists undo history across sessions
o.undodir = vim.fn.stdpath("cache") .. "/undo"   -- store undo files in ~/.cache/nvim/undo
vim.fn.mkdir(vim.fn.stdpath("cache") .. "/undo", "p") -- creates the undo directory if it doesnt exit
o.scrolloff = 5 --  keeps 5 lines of context above/below the cursor when scrolling


-- // ############################## // --
-- // #### AUTOCMDS & FUNCTIONS #### // --
-- // ############################## // --

local autocmd = vim.api.nvim_create_autocmd

-- // Briefly flashes the yanked(copied) region after you yank(copy)
autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
})

-- // Removes trailing white spaces and recovers the cursor position after that
autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})

-- // This links the line number colors to colorscheme's Title highlight group
local function apply_number_highlights()
  pcall(vim.cmd, "highlight! link LineNr Title")
  pcall(vim.cmd, "highlight! link CursorLineNr Title")
end

apply_number_highlights() -- run once on startup

autocmd("ColorScheme", {
  callback = function()
    apply_number_highlights() -- re-run on theme change
  end,
})

-- // Native terminal settings
local terminal_buf = -1 -- tracks the terminal buffer across toggles
local terminal_win = -1 -- tracks the terminal window across toggles

local function toggle_terminal()
    -- if terminal is open, close it
    if vim.api.nvim_win_is_valid(terminal_win) then
        vim.api.nvim_win_close(terminal_win, false)
        terminal_win = -1
        return
    end

    -- open a horizontal split at the bottom, 10 lines tall
    vim.cmd("belowright split")
    vim.cmd("resize 10")
    terminal_win = vim.api.nvim_get_current_win()

    -- reuse existing terminal session if available, otherwise create a new one
    if vim.api.nvim_buf_is_valid(terminal_buf) then
        vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
    else
        vim.cmd("terminal")
        terminal_buf = vim.api.nvim_get_current_buf()
    end

    vim.cmd("startinsert") -- enter insert mode automatically
end

-- // ########################### // --
-- // ####  GLOBAL KEYMAPS  ##### // --
-- // ########################### // --

local keymap = vim.keymap.set
local s = { silent = true } -- suppresses commands from being echoed in the command line, which is visually noisy

vim.g.mapleader = " " -- sets leader key to "space bar"

keymap("n", "<space>", "<Nop>", s) -- if space is pressed in normal mode, do nothing. Prevents flickers
keymap("i", "jk", "<Esc>", s) -- because I like to use "jk" to enter normal mode rather than esc
keymap("n", "sa", "ggVG", s) -- selects all text in the buffer. gg(jumps to the first line), V(enters visual mode), G(jumps to last line)
keymap("n", "<C-d>", "<C-d>zz",s) -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz", s) -- Scroll up and center the cursor
keymap("n", "<C-h>", "<C-w>h", s) -- move to left split
keymap("n", "<C-l>", "<C-w>l", s) -- move to right split
keymap("n", "<C-j>", "<C-w>j", s) -- move to split below
keymap("n", "<C-k>", "<C-w>k", s) -- move to split above
keymap("v", "<Leader>p", '"_dP', s) -- paste over selected text without losing the afore-copied text
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s) -- split the window vertically
keymap("n", "<Leader>-", "<cmd>split<CR>", s) -- split the window horizontally
keymap("n", "<leader>up", '<cmd>lua vim.pack.update()<CR>') -- updates vim.pack packages


keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- j navigates visual rows normally, but uses real lines when given a count (e.g. 5j)
keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true }) -- k navigates visual rows normally, but uses real lines when given a count (e.g. 8k)
keymap("n", "<Leader>f", function()
    vim.lsp.buf.format({ async = true })
end, s) -- formats the current buffer using LSP, async = true so formatting doesn't block the editor on large files

keymap("n", "<Leader>t", toggle_terminal, s)  -- toggle terminal at bottom
keymap("t", "jk", "<C-\\><C-N>", s)           -- exit terminal mode
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", s)  -- move to left split
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", s)  -- move to split below
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", s)  -- move to split above
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", s)  -- move to right split
keymap("t", "<Leader>_", "<cmd>vsplit | terminal<CR>", s) -- Open new terminal in vertical split
