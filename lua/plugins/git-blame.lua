-- Know who made a given commit in a repo
vim.pack.add({"https://github.com/f-person/git-blame.nvim"})

require("gitblame").setup({
    enabled = false,
    vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<CR>")
})
