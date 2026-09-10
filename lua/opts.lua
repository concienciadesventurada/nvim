vim.g.mapleader = " "

vim.opt.cmdheight = 0

vim.cmd.colorscheme = "habamax"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes:1" -- Line column indenting
vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.cursorline = true

vim.opt.selection = "inclusive"

vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.breakindent = true
-- vim.opt.textwidth = 80

vim.opt.completeopt = "menuone,noinsert,fuzzy,nosort,noselect"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wildmenu = true
vim.opt.conceallevel = 2 -- obsidian requirement
vim.opt.concealcursor = "" -- do not hide cursorline in markup

-- No backup files by vim, all done by undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true -- For tricky searches: /vim.* = | allows wildcards

vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- cursor blinking and settings

vim.opt.signcolumn = "yes" -- always show a sign column

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.hidden = true -- hidden buffers

vim.opt.autochdir = false
vim.opt.encoding = "utf-8"

vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

vim.opt.spelllang = { "es_es", "en_us" }
vim.opt.spell = true
