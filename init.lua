require('config')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fb", ":Telescope file_browser hidden=true)<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fp", ":Telescope file_browser)<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>tt", ":lua vim.diagnostic.config({ virtual_text = false })<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tr", ":lua vim.diagnostic.config({ virtual_text = true })<CR>", { noremap = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>-", '<cmd>split<Return><C-w>w<CR>')
vim.keymap.set('n', '<leader>_', '<cmd>vsplit<Return><C-w>w<CR>')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', '<leader><left>', '<C-w><')
vim.keymap.set('n', '<leader><right>', '<C-w>>')
vim.keymap.set('n', '<leader><up>', '<C-w>+')
vim.keymap.set('n', '<leader><down>', '<C-w>-')
vim.keymap.set("n", "<leader>vps", "<cmd>e ~/.config/nvim/lua/config/set.lua<CR>");
vim.keymap.set("n", "<leader>vpm", "<cmd>e ~/.config/nvim/lua/config/maps.lua<CR>");
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

require('lazy').setup('plugins')
