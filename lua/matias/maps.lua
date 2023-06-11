-- ################## LEADER AND NAVIGATION ################## 
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fb", ":Telescope file_browser hidden=true)<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fp", ":Telescope file_browser)<CR>", { noremap = true })

vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeToggle)

-- Opens Netrw  = DISABLED BY NvimTree plugin
--vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

-- ################## LSP/FORMATTING ################## 
-- Toggles inline errors on/off
vim.keymap.set("n", "<leader>tt", ":lua vim.diagnostic.config({ virtual_text = false })<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tr", ":lua vim.diagnostic.config({ virtual_text = true })<CR>", { noremap = true })

vim.keymap.set("n", "<leader><leader>", ":Prettier<CR>")

-- ################## TEXT EDITING ################## 

-- Moves a block of code respecting indentation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Deletes line below and pastes on current line keeping the cursors position
vim.keymap.set("n", "J", "mzJ`z")

-- Vertical movement 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Pastes whats on the buffer on the last active panel, where it had its cursor
-- When text is selected it replaces it also keeps anything in the yanked buffer 
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yanks to system clipboard!
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- It deletes like dd but to the void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Escapes insert mode, literally 
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Global search&replace with the current word the cursor is on 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Keeps searched term in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Makes executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- ################## PANE MOVEMENT ################## 

-- Split tab horizontal, switches to it automatically
vim.keymap.set("n", "<leader>-", '<cmd>split<Return><C-w>w<CR>')
-- Split tab vertical, switches to it automatically
vim.keymap.set('n', '<leader>_', '<cmd>vsplit<Return><C-w>w<CR>')

-- Move window
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sl', '<C-w>l')

-- Resize window
vim.keymap.set('n', '<leader><left>', '<C-w><')
vim.keymap.set('n', '<leader><right>', '<C-w>>')
vim.keymap.set('n', '<leader><up>', '<C-w>+')
vim.keymap.set('n', '<leader><down>', '<C-w>-')


-- ################## VIM CONFIGS ################## 

-- Opens packer.lua
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/matias/packer.lua<CR>");

-- Opens packer.lua
vim.keymap.set("n", "<leader>vps", "<cmd>e ~/.config/nvim/lua/matias/set.lua<CR>");

-- Opens maps.lua
vim.keymap.set("n", "<leader>vpm", "<cmd>e ~/.config/nvim/lua/matias/maps.lua<CR>");

-- ################## MISC ################## 

-- No idea what the do (yet)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- The idea is to save the error messages from the compiler in a file and use 
-- Vim to jump to the errors one by one.  You can examine each problem and 
-- fix it, without having to remember all the error messages.
-- Signatures
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- Locations
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--vim.keymap.set("n", "Q", "<nop>")

-- Haven't linked with tmux yet due to ohmytmux! use, but it creates tmux
-- sessions with determined panes and programs
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
