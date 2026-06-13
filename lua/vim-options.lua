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
