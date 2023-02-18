-- Block cursor
vim.opt.guicursor = ""

-- Lines and column
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10
-- Line column indenting
vim.opt.signcolumn = "yes:1"

-- Indenting and tab spacing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.smartindent = true

vim.opt.wrap = false

-- No backup files by vim, all done by
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- No highlighting while /searching
vim.opt.hlsearch = true
-- For tricky searches: /vim.* = | allows wildcards
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- StackOverflow: It'll show an OS dependent list of all characters considered  
-- being possibly part of a file name. Hence it won't be considered by gF as a
-- separator between file name and line number.
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Its supposed to ignore node_modules on webdev but i don't see it working 
vim.opt.wildignore:append { '*/node_modules/*' }

vim.breakindent = true

vim.opt.cmdheight = 1
