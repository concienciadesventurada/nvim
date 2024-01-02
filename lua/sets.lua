vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes:1" -- Line column indenting
vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.smartindent = true
vim.breakindent = true
vim.opt.textwidth = 80

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- No backup files by vim, all done by undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true -- For tricky searches: /vim.* = | allows wildcards

vim.opt.wildignore:append { '*/node_modules/*' }
